BASEDIR="_build/iqp-offline_book"
SITEDIRNAME="site"
# non-standard ports, so a development server on 3000/3100 can keep running
PORT=3400
SERVER_PORT=3500
URL="http://localhost:$PORT"

echo "make offline book: starting book server at $URL ..."
jupyter book start --execute --port $PORT --server-port $SERVER_PORT > /dev/null 2>&1 &
SERVER_PID=$!
trap 'pkill -P $SERVER_PID; kill $SERVER_PID 2> /dev/null' EXIT
until curl -sf "$URL/" > /dev/null; do
  kill -0 $SERVER_PID 2> /dev/null || { echo "book server failed to start"; exit 1; }
  sleep 2
done

rm -rf "$BASEDIR"

wget --mirror --convert-links --page-requisites --no-parent --adjust-extension \
--directory-prefix="$BASEDIR/$SITEDIRNAME" --no-host-directories "$URL/"

cat > "$BASEDIR/index.html" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="refresh" content="0; url=$SITEDIRNAME/index.html">
  <title>Redirecting…</title>
</head>
<body>
  <p>If you are not redirected automatically, <a href="$SITEDIRNAME/index.html">click here</a>.</p>
</body>
</html>
EOF

# Interactive HTML outputs (e.g. Altair charts) are loaded by the site's JavaScript, which browsers block
# for local files. Download them and show them in iframes instead; the iframe reports its height to the page.
python3 - "$BASEDIR/$SITEDIRNAME" "$URL" << 'EOF'
import glob, json, os, re, sys, urllib.parse, urllib.request

site, url = sys.argv[1:]
report_height = ('<script>new ResizeObserver(() => { const b = document.body, d = document.documentElement; '
                 'b.style.zoom = 1; b.style.zoom = Math.min(1, innerWidth / d.scrollWidth); '  # shrink to fit width
                 'parent.postMessage({offlineHeight: d.scrollHeight}, "*") }).observe(document.body)</script>')
resize_iframes = ('<script>addEventListener("message", e => { for (const f of document.querySelectorAll('
                  '"iframe.offline-output")) if (f.contentWindow === e.source && e.data.offlineHeight) '
                  'f.style.height = e.data.offlineHeight + 20 + "px" })</script>')

def outputs(node):  # all "outputs" nodes in the page tree
    if isinstance(node, dict):
        if node.get("type") == "outputs":
            yield node
        node = list(node.values())
    if isinstance(node, list):
        for child in node:
            yield from outputs(child)

for page in glob.glob(os.path.join(site, "*.html")):
    name = os.path.basename(page)[:-5]
    with urllib.request.urlopen(f"{url}/{name}.json") as r:
        tree = json.load(r)
    html = open(page, encoding="utf-8").read()
    changed = False
    for out in outputs(tree):
        for o in out.get("children", []):
            data = o.get("jupyter_data", {}).get("data", {}).get("text/html", {})
            if "path" not in data:
                continue
            fname = data["hash"] + ".html"
            with urllib.request.urlopen(urllib.parse.urljoin(url, data["path"])) as r:
                content = r.read().decode("utf-8")
            with open(os.path.join(site, fname), "w", encoding="utf-8") as f:
                f.write(content + report_height)
            placeholder = (r'(<div data-name="outputs-container" id="' + re.escape(out["html_id"]) +
                           r'"[^>]*>)<div><div class="p-2.5">Loading...</div></div>')
            iframe = f'<iframe class="offline-output" src="{fname}" style="width:100%;height:500px;border:0"></iframe>'
            html, n = re.subn(placeholder, lambda m: m.group(1) + iframe, html)
            changed |= n > 0
            print(f"{name}: embedded {fname}" + ("" if n else " - placeholder NOT found"))
    if changed:
        open(page, "w", encoding="utf-8").write(html.replace("</body>", resize_iframes + "</body>"))
EOF

(cd _build && rm -f iqp-offline_book.zip && zip -qr iqp-offline_book.zip iqp-offline_book)

echo "done, zip is _build/iqp-offline_book.zip, or you can open $BASEDIR/$SITEDIRNAME/index.html"


