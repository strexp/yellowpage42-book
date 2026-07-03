# YellowPage42 Book

A comprehensive telephone directory for the dn42 telephony network, written in Typst.

This project generates a professional PDF directory containing categorized listings of registered phone numbers, NOC (Network Operations Center) contacts, and dial plan information for the dn42 network community.

## Prerequisites

- [Typst](https://typst.app/)
- Make

## Building

Extract registry meta:

```bash
python3 utils/extract_noc_contacts.py --registry {path_to_dn42_registry} --output assets/data-noc.json
```

Build the PDF:

```bash
make build
```

Watch for changes with automatic rebuild:

```bash
make watch
```

Build the PDF for A4 booklet (`pypdf` is required):

```bash
python3 utils/a5_to_a4_booklet.py main.pdf {output_a4_pdf_name}
```

Build the PDF for long edge reversal double-sided printing (`pypdf` is required):

```bash
python3 utils/rotate.py {output_a4_pdf_name} {output_a4_rotated_pdf_name}
```

## Font Requirements

The document uses the following font families:
- **Newsreader** — Body text & Phone numbers (serif)
- **Archivo Narrow** — Headings and UI elements (sans-serif)
- **Fraunces** — Display and cover text

Ads uses the following font families:
- Alfa Slab One
- Anton
- Pacifico
- Special Elite

For proper Chinese/CJK character support, Noto Serif CJK SC is configured as fallback font.

**Typst >= 0.15.0 required! (for variable fonts)**

## Data Sources

- Public Telephone directory data: https://yp.dn42
- NOC Contact directory data: https://git.dn42.dev

## License

This work is licensed under:

**CC-BY-NC-SA 4.0** (Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International).
