echo "make offline book: it needs the local myth server to be running at http://localhost:3000 !"

BASEDIR="_build/iqp-offline_book"
SITEDIRNAME="site"

rm -r "$BASEDIR"

wget --mirror --convert-links --page-requisites --no-parent --adjust-extension \
--directory-prefix="$BASEDIR/$SITEDIRNAME" --no-host-directories http://localhost:3000/

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

(cd _build && zip -r iqp-offline_book.zip iqp-offline_book)

echo "done, zip is _build/iqp-offline_book.zip, or you can open $BASEDIR/$SITEDIRNAME/index.html"


