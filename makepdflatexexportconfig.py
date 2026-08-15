#!/usr/bin/env python

"""
needs pip install pyyaml
"""

import sys
import yaml

MYST_YML = "myst.yml"
EXPORT_YML = "export.yml"

def walk_toc(entries, depth=0):
    for entry in entries:
        if "file" in entry:
            file = entry["file"]
            level = depth #-1 if file == "index.md" else depth
            yield file, level
        children = entry.get("children", [])
        if children:
            yield from walk_toc(children, depth + 1)


def main():
    with open(MYST_YML, encoding="utf-8") as f:
        config = yaml.safe_load(f)

    toc = config.get("project", {}).get("toc")
    if not toc:
        print(f"Error: no project.toc found in {MYST_YML}", file=sys.stderr)
        sys.exit(1)

    articles = [{"file": file, "level": level} for file, level in walk_toc(toc)]

    output = {
        "version": 1,
        "project": {
            "exports": [
                {
                    "format": "pdf",
                    "template": "plain_latex_book",
                    "output": "_build/exports/iqp-book.pdf",
                    "authors": "Wolfgang Löffler",
                    "articles": articles,
                }
            ]
        },
    }

    with open(EXPORT_YML, "w", encoding="utf-8") as f:
        yaml.dump(output, f, sort_keys=False, default_flow_style=False)

    print(f"Wrote {EXPORT_YML} ({len(articles)} articles)")


if __name__ == "__main__":
    main()