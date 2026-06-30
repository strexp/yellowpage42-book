#!/usr/bin/env python3

import argparse
import json
import re
from pathlib import Path
from typing import Any, Dict, List, Optional


def parse_rpsl(content: str) -> Dict[str, Any]:
    result: Dict[str, Any] = {}
    current_key: Optional[str] = None

    for line in content.split("\n"):
        if not line or line.startswith("#"):
            continue

        if line.startswith(" ") or line.startswith("\t"):
            if current_key:
                if isinstance(result[current_key], list):
                    result[current_key][-1] = (
                        result[current_key][-1] + " " + line.strip()
                    )
                else:
                    result[current_key] = result[current_key] + " " + line.strip()
            continue

        match = re.match(r"^([a-zA-Z0-9_-]+):\s*(.*)$", line)
        if match:
            key = match.group(1).lower()
            value = match.group(2).strip()

            if key in result:
                if not isinstance(result[key], list):
                    result[key] = [result[key]]
                result[key].append(value)
            else:
                result[key] = value

            current_key = key

    return result


def read_rpsl_file(filepath: Path) -> Optional[Dict[str, Any]]:
    try:
        content = filepath.read_text(encoding="utf-8", errors="ignore")
        return parse_rpsl(content)
    except Exception as e:
        print(f"Error reading {filepath}: {e}")
        return None


def has_phone_field(data: Dict[str, Any]) -> bool:
    return "phone" in data and data["phone"]


def extract_phones(data: Dict[str, Any]) -> List[str]:
    phones = data.get("phone", [])
    if not isinstance(phones, list):
        phones = [phones] if phones else []
    return phones


def extract_first_email(data: Dict[str, Any]) -> Optional[str]:
    # e-mail field
    e_mail: str | list[str] = data.get("e-mail", [])
    if isinstance(e_mail, list) and e_mail:
        return e_mail[0]
    elif isinstance(e_mail, str) and e_mail:
        return e_mail
    return None


def get_primary_name(data: Dict[str, Any], obj_type: str) -> str:
    if obj_type == "person":
        return data.get("person", "")
    else:
        name = data.get("org-name", "")
        if not name:
            name = data.get("organisation", "")
        return name


def get_object_id(data: Dict[str, Any], obj_type: str) -> str:
    if obj_type == "person":
        return data.get("nic-hdl", "")
    else:
        return data.get("organisation", "")


def process_person_or_org(
    data: Dict[str, Any], obj_type: str
) -> Optional[Dict[str, Any]]:
    if not has_phone_field(data):
        return None

    phones = extract_phones(data)
    if not phones:
        return None

    obj_id = get_object_id(data, obj_type)
    name = get_primary_name(data, obj_type)

    if not obj_id:
        return None

    result = {
        "id": obj_id,
        "name": name,
        "phones": phones,
    }

    email = extract_first_email(data)
    if email:
        result["email"] = email

    return result


def find_rpsl_files(directory: Path) -> List[Path]:
    if not directory.exists():
        return []

    files = []
    for item in directory.iterdir():
        if item.is_file() and not item.name.startswith("."):
            files.append(item)
    return files


def main():
    parser = argparse.ArgumentParser(
        description="Extract NOC contacts from DN42 registry files"
    )
    parser.add_argument(
        "--registry",
        type=str,
        required=True,
        help="Path to the DN42 registry directory (default: ~/registry)",
    )
    parser.add_argument(
        "--output",
        type=str,
        default="assets/data-noc.json",
        help="Output JSON file path (default: assets/data-noc.json)",
    )

    args = parser.parse_args()

    registry_path = Path(args.registry)
    output_path = Path(args.output)

    output_path.parent.mkdir(parents=True, exist_ok=True)

    person_dir = registry_path / "data" / "person"
    org_dir = registry_path / "data" / "organisation"

    print(f"Reading data from: {registry_path}")

    persons: List[Dict[str, Any]] = []
    organisations: List[Dict[str, Any]] = []

    if person_dir.exists():
        person_files = find_rpsl_files(person_dir)
        print(f"Found {len(person_files)} person files")

        for filepath in person_files:
            data = read_rpsl_file(filepath)
            if data:
                contact = process_person_or_org(data, "person")
                if contact:
                    persons.append(contact)
    else:
        print(f"Warning: Person directory not found: {person_dir}")

    if org_dir.exists():
        org_files = find_rpsl_files(org_dir)
        print(f"Found {len(org_files)} organisation files")

        for filepath in org_files:
            data = read_rpsl_file(filepath)
            if data:
                contact = process_person_or_org(data, "organisation")
                if contact:
                    organisations.append(contact)
    else:
        print(f"Warning: Organisation directory not found: {org_dir}")

    persons.sort(key=lambda x: x["id"])
    organisations.sort(key=lambda x: x["id"])

    output = {
        "persons": persons,
        "organisations": organisations,
    }

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(output, f, indent=2, ensure_ascii=False)

    total = len(persons) + len(organisations)
    print(f"\nExtracted {total} contacts with phone numbers")
    print(f"  - Persons: {len(persons)}")
    print(f"  - Organisations: {len(organisations)}")
    print(f"Output written to: {output_path}")


if __name__ == "__main__":
    main()
