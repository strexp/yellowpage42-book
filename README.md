# YellowPage42 Book

A comprehensive telephone directory for the dn42 telephony network, written in Typst.

This project generates a professional PDF directory containing categorized listings of registered phone numbers, NOC (Network Operations Center) contacts, and dial plan information for the dn42 network community.

## Prerequisites

- [Typst](https://typst.app/)
- Make

## Building

Build the PDF:

```bash
make build
```

Watch for changes with automatic rebuild:

```bash
make watch
```

## Font Requirements

The document uses the following font families:
- **Newsreader** — Body text (serif)
- **Plus Jakarta Sans** — Headings and UI elements (sans-serif)
- **Space Mono** — Phone numbers (monospace)
- **Fraunces** — Display and cover text

For proper Chinese/CJK character support, Noto Serif CJK SC is configured as fallback font.

## Data Sources

- Public Telephone directory data: https://yp.dn42
- NOC Contact directory data: https://git.dn42.dev

## License

This work is licensed under:

**CC-BY-NC-SA 4.0** (Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International).
