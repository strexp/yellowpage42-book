#!/usr/bin/env python3

import sys
import math
from pathlib import Path

from pypdf import PdfReader, PdfWriter, PaperSize, Transformation


def create_booklet(input_path: str, output_path: str):
    input_file = Path(input_path)
    if not input_file.exists():
        print(f"Error: input file {input_path} not exists")
        return False

    reader = PdfReader(input_path)
    total_pages = len(reader.pages)
    print(f"Pages (input): {total_pages}")

    pages_needed = math.ceil(total_pages / 4) * 4
    blank_pages_to_add = pages_needed - total_pages

    print(f"Pages (input, new): {pages_needed} (added {blank_pages_to_add} blank page)")

    a4_width = PaperSize.A4.height
    a4_height = PaperSize.A4.width

    a5_width = PaperSize.A5.width
    a5_height = PaperSize.A5.height

    print(f"A4: {a4_width} x {a4_height} pt")
    print(f"A5: {a5_width} x {a5_height} pt")

    writer = PdfWriter()

    all_pages = []
    for i in range(total_pages - 1):
        all_pages.append(reader.pages[i])
    for _ in range(blank_pages_to_add):
        all_pages.append(None)
    all_pages.append(reader.pages[total_pages - 1])

    sheets = pages_needed // 4
    print(f"Pages (output): {sheets}")
    print()

    print("Pages:")
    print("-" * 50)

    for sheet in range(sheets):
        front_left = pages_needed - sheet * 2
        front_right = sheet * 2 + 1
        back_left = sheet * 2 + 2
        back_right = pages_needed - sheet * 2 - 1

        print(f"Sheet {sheet+1} front: left={front_left:2d} | right={front_right:2d}")
        print(f"Sheet {sheet+1} back: left={back_left:2d} | right={back_right:2d}")

        fl_idx = front_left - 1
        fr_idx = front_right - 1
        bl_idx = back_left - 1
        br_idx = back_right - 1

        # front
        a4_front = writer.add_blank_page(width=a4_width, height=a4_height)

        # front_left
        if fl_idx < len(all_pages) and all_pages[fl_idx] is not None:
            left_page = all_pages[fl_idx]
            a5_orig_width = float(left_page.mediabox.width)
            a5_orig_height = float(left_page.mediabox.height)
            scale = min(a5_width / a5_orig_width, a5_height / a5_orig_height)

            x_offset = (a5_width - a5_orig_width * scale) / 2
            y_offset = (a5_height - a5_orig_height * scale) / 2
            transform = Transformation().scale(scale, scale).translate(x_offset, y_offset)

            a4_front.merge_transformed_page(left_page, transform)

        # front_right
        if fr_idx < len(all_pages) and all_pages[fr_idx] is not None:
            right_page = all_pages[fr_idx]
            a5_orig_width = float(right_page.mediabox.width)
            a5_orig_height = float(right_page.mediabox.height)
            scale = min(a5_width / a5_orig_width, a5_height / a5_orig_height)

            x_offset = a5_width + (a5_width - a5_orig_width * scale) / 2
            y_offset = (a5_height - a5_orig_height * scale) / 2
            transform = Transformation().scale(scale, scale).translate(x_offset, y_offset)

            a4_front.merge_transformed_page(right_page, transform)

        # back
        a4_back = writer.add_blank_page(width=a4_width, height=a4_height)

        # back_left
        if bl_idx < len(all_pages) and all_pages[bl_idx] is not None:
            left_page = all_pages[bl_idx]
            a5_orig_width = float(left_page.mediabox.width)
            a5_orig_height = float(left_page.mediabox.height)
            scale = min(a5_width / a5_orig_width, a5_height / a5_orig_height)

            x_offset = (a5_width - a5_orig_width * scale) / 2
            y_offset = (a5_height - a5_orig_height * scale) / 2
            transform = Transformation().scale(scale, scale).translate(x_offset, y_offset)

            a4_back.merge_transformed_page(left_page, transform)

        # back_right
        if br_idx < len(all_pages) and all_pages[br_idx] is not None:
            right_page = all_pages[br_idx]
            a5_orig_width = float(right_page.mediabox.width)
            a5_orig_height = float(right_page.mediabox.height)
            scale = min(a5_width / a5_orig_width, a5_height / a5_orig_height)

            x_offset = a5_width + (a5_width - a5_orig_width * scale) / 2
            y_offset = (a5_height - a5_orig_height * scale) / 2
            transform = Transformation().scale(scale, scale).translate(x_offset, y_offset)

            a4_back.merge_transformed_page(right_page, transform)

    print("-" * 50)
    print(f"\nOutput file: {output_path}")

    if reader.metadata:
        writer.add_metadata(reader.metadata)
        print("✓ Copied PDF metadata from source")

    with open(output_path, "wb") as output_file:
        writer.write(output_file)

    print("✓ Done!")
    print()

    return True


def main():
    if len(sys.argv) != 3:
        print("Usage: python a5_to_a4_booklet.py <input.pdf> <output.pdf>")
        print()
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    create_booklet(input_path, output_path)


if __name__ == "__main__":
    main()
