# Regex

Regular expressions (regex) are patterns for matching text. They let you describe the shape of a string — "a date that looks like DD/MM/YYYY" or "a word followed by a number" — and find, validate, or transform every instance in a document or dataset. They're used in data cleaning, text extraction, search-and-replace, and input validation.

In clinical research, regex is useful more often than you'd expect. Extracting medication dosages from free-text notes, finding ICD codes that match a pattern, cleaning inconsistent date formats, or parsing structured fields out of semi-structured text — these are all regex problems. A small investment in learning regex pays off every time you need to work with text data, which in clinical research is often.

Regex syntax is the same across most languages and tools. A pattern you write in Python works in SQL, in your text editor, and in the command line. The syntax looks dense at first (`\d{2}/\d{2}/\d{4}`) but becomes readable with practice — that pattern just means "two digits, a slash, two digits, a slash, four digits."

## Getting Started

Regex doesn't require installation — it's built into Python, most text editors, and command-line tools. The best way to learn is with an interactive tester where you can see matches update in real time.

| Tool | Notes |
|---|---|
| [RegExr](https://regexr.com) | Browser-based regex tester with real-time matching, a built-in reference panel, and community-submitted patterns. The best place to start experimenting |
| [regex101](https://regex101.com) | Similar to RegExr with detailed match explanations. Supports Python, JavaScript, Go, and other flavors |

## Quick References

- [Regex Quick Reference (RexEgg)](https://www.rexegg.com/regex-quickstart.php) — reference tables designed to teach by example, covering character classes, quantifiers, anchors, and groups
- [DataCamp Regex Cheat Sheet](https://www.datacamp.com/cheat-sheet/regular-expresso) — Python-focused regex reference with common patterns for data cleaning and text extraction
- [QuickRef.me Regex](https://quickref.me/regex.html) — single-page reference covering the full regex syntax

## Courses

| Course | Platform | Notes |
|---|---|---|
| [Regular Expressions in Python](https://www.datacamp.com/courses/regular-expressions-in-python) | DataCamp | Pattern matching, groups, and lookaheads applied to real data cleaning and text extraction tasks |
| [Regex Tutorial](https://regextutorial.org) | regextutorial.org | Free interactive exercises covering character classes, quantifiers, groups, and anchors with immediate feedback |
