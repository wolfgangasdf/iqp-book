#!/usr/bin/env python3
"""
Updates standard frontmatter except for excluded files (index.md)
"""

from pathlib import Path
import textwrap

EXCLUDE_FILES = { "index.md", "appendix.md", "development.md", "formula-sheet.md", "solutions.md" }
# to enable chapter.x numbering, need to map chapter names to chapter numbers.
chapterdict = { "b": 1, "se": 2, "qm3d": 3, "sp": 4, "tp": 5, "pt": 6, "ad": 7}

NEW_FRONTMATTER = """\
kernelspec:
    display_name: Python 3
    language: python
    name: python3
numbering:
    headings: true
"""

def replace_frontmatter(path: Path) -> bool:
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

    chname = path.name.split(".")[0].split("-")[0]
    ch = chapterdict[chname]
    ns = "continue: true"
    if path.name == chname + ".md":
        ns = "start: 1"

    new_frontmatter = textwrap.dedent(f"""\
        kernelspec:
            display_name: Python 3
            language: python
            name: python3
        numbering:
            headings: true
            figure:
                {ns}
                enumerator: "{ch}.%s"
            equation:
                {ns}
                enumerator: "{ch}.%s"
    """)

    print(f"\n*** file: {path.name}")
    print(f"new frontmatter:\n{new_frontmatter}")

    new_lines = ["---\n", new_frontmatter, "---\n"] + lines[end_idx + 1:]
    path.write_text("".join(new_lines), encoding="utf-8")
    return True


def main():
    md_files = sorted(Path(".").glob("*.md"))

    for path in md_files:
        if path.name in EXCLUDE_FILES:
            print(f"\n*** skipped: {path}")
            continue

        res = replace_frontmatter(path)
        print(f"Replaced frontmatter for {path}: {res}")


if __name__ == "__main__":
    main()