#!/usr/bin/env python3
"""
Updates standard frontmatter except for excluded files (index.md)
"""

from pathlib import Path

EXCLUDE_FILES = { "index.md", "appendix.md", "development.md", "formula-sheet.md", "solutions.md" }

NEW_FRONTMATTER = """\
kernelspec:
    display_name: Python 3
    language: python
    name: python3
numbering:
    headings: true
"""

def replace_frontmatter(path: Path, new_body: str) -> bool:
    """Returns True if replaced."""
    text = path.read_text(encoding="utf-8")
    lines = text.splitlines(keepends=True)

    if not lines or lines[0].rstrip("\n") != "---":
        return False

    end_idx = None
    for i, line in enumerate(lines[1:], start=1):
        if line.rstrip("\n") == "---":
            end_idx = i
            break

    if end_idx is None:
        return False

    new_lines = ["---\n", new_body, "---\n"] + lines[end_idx + 1:]
    path.write_text("".join(new_lines), encoding="utf-8")
    return True


def main():
    md_files = sorted(Path(".").glob("*.md"))

    for path in md_files:
        if path.name in EXCLUDE_FILES:
            print(f"Excluded: {path}")
            continue

        res = replace_frontmatter(path, NEW_FRONTMATTER)
        print(f"Replaced frontmatter for {path}: {res}")


if __name__ == "__main__":
    main()