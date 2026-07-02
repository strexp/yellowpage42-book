#import "../lib/templates.typ": body-section

#body-section(
  [
    #heading(numbering: none)[Appendix]

    #block(width: 100%, stroke: 0.5pt, inset: 10pt, fill: luma(250))[
      *Disclaimer:* This appendix is provided for reference purposes only. Routing policies and dial plans may vary by region and service provider within the dn42 network. Always consult your local network administrator for specific dialing instructions.
    ]

    #v(1em)

    == Dial Plan

    The dn42 telephony network uses the +042 international country code prefix, followed by a variable-length subscriber number. The general format is:

    #block(width: 100%, inset: 10pt)[
      #set align(center)
      #text(size: 16pt, number-width: "tabular")[
        *+042-N-XXXX-{SN}*
      ]

      #text(size: 8pt)[
        Country Code · Allocation Prefix · Network Prefix · Subscriber Number
      ]
    ]

    #v(1em)

    *Direct Dialing:*

    - *From within the dn42 telephony network* \ Dial the full number starting with +042.

    - *From PSTN gateways* \ Check with your gateway provider for access codes and dialing procedures.

    #v(1em)

    *Quick Dialing / Short Number Dialing:*

    Some service providers support abbreviated dialing for calls within their network or local area.

    - #text(size: 10pt)[*N-XXXX-{SN}*] \ Dialing without the +042 country code prefix. Supported by some local dn42 providers for intra-network calls.

    - #text(size: 10pt)[*{SN}*] \ Subscriber number only. Available on some networks when the subscriber number has a fixed length and the call remains within the same carrier's network.

    #v(1em)

    *Note:* Quick dialing availability depends on your service provider and network configuration. Always verify with your provider before relying on abbreviated dialing methods.
    #v(1em)

    == Emergency Numbers

    #table(
      columns: (auto, 1fr, 1fr),
      inset: 8pt,
      stroke: 0.5pt,
      table.header([*Number*], [*Service*], [*Notes*]),
      table.cell(colspan: 3, [
        Currently, no carrier provides a unified emergency service within the dn42 telephone network. \
        Emergency services are not guaranteed and availability varies by provider. \
        Please consult your access provider to inquire about emergency service availability in your area.
      ]),
    )

    #v(1em)

    *Important:* For real emergencies, use your local PSTN emergency services (such as 911, 112, or 999) rather than relying on dn42 network services.
  ],
)
