#import "../lib/templates.typ": icon-list-item, language-code-table
#import "../lib/layout.typ": setpagefooter

#pagebreak(to: "odd")
#show: doc => setpagefooter(doc)
#set page(numbering: "i")
#counter(page).update(1)
#heading(numbering: none)[How to Use This Directory]

Welcome to the dn42 Public Telephone Directory. This publication provides a comprehensive, categorized listing of all registered telephone services and communication lines within the dn42 network.

Entries are organized by service type and sorted alphabetically within each category for easy reference. Each listing includes the service name, contact number, maintainer information, and available features.

#v(1em)

== List of Sections:

- #icon-list-item("phone", "Standard Landline / Analog SIP")
- #icon-list-item("mobile", "Mobile / Cellular Terminal")
- #icon-list-item("music", "Audio Broadcast / Music Stream")
- #icon-list-item("number-readout", "Automated System / Number Readout")
- #icon-list-item("ivr", "Interactive Voice Response")
- #icon-list-item("fax", "Fax Machine / Service")
- #icon-list-item("gateway", "Gateway / Bridge Service")
- #icon-list-item("conference", "Conference Bridge")
- #icon-list-item("echo-test", "Echo Test Service")
- #icon-list-item("modem", "Modem / Dial-up Service")
- #icon-list-item("other", "Unclassified / Other Terminal")

#v(1em)

== List of Symbols:

- #icon-list-item("sms", "Message Available")

#v(1em)

== List of Language Codes

#language-code-table()

#v(1em)

== Maintainer (MNT) Information:

Each entry displays the MNT (Maintainer) identifier below the phone number. This identifier corresponds to the maintainer handle registered in the dn42 Registry.

If you encounter any issues with a specific line, or need to report changes or corrections, please contact the designated maintainer through the dn42 Registry system.
