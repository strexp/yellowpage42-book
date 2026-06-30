#!/usr/bin/env python3

import sys
from pathlib import Path

from pypdf import PdfReader, PdfWriter


def rotate_pdf(input_path: str, output_path: str):
    input_file = Path(input_path)
    if not input_file.exists():
        print(f"Error: input file {input_path} not exists")
        return False

    reader = PdfReader(input_path)
    writer = PdfWriter()

    total_pages = len(reader.pages)
    print(f"Pages: {total_pages}")

    for i, page in enumerate(reader.pages):
        page_num = i + 1

        if page_num % 2 == 0:
            page.rotate(180)
            print(f"Page {page_num}: rotated 180°")
        else:
            print(f"Page {page_num}: no rotation")

        writer.add_page(page)

    if reader.metadata:
        writer.add_metadata(reader.metadata)

    with open(output_path, "wb") as output_file:
        writer.write(output_file)

    print(f"\nOutput file: {output_path}")
    print("✓ Done!")

    return True


def main():
    if len(sys.argv) != 3:
        print("Usage: python rotate.py <input.pdf> <output.pdf>")
        print()
        print("Description: Rotate even pages (2, 4, 6...) by 180 degrees,")
        print("             odd pages (1, 3, 5...) remain unchanged.")
        print()
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    rotate_pdf(input_path, output_path)


if __name__ == "__main__":
    main()
