#import "../../variables.typ": *

// Returns the ad content as a block that can be placed with place(float: true)
#let ad-content = block(
  width: 100%,
  stroke: 1.5pt + luma(70),
  fill: luma(250),
  inset: (top: 1em, bottom: 1.2em, left: 0.8em, right: 0.8em),
  radius: 0pt,
)[
  #align(center)[
    #box(width: 100%, fill: luma(20), inset: 0.4em)[
      #text(font: book_ad_font_sans_heavy, size: 11pt, fill: white, tracking: 1.5pt)[
        ESTABLISHED 2026
      ]
    ]
    #text(font: book_ad_font_script, size: 28pt, fill: luma(10))[
      yp.dn42
    ]
    #v(1em)
    #text(font: book_ad_font_slab, size: 10pt, fill: luma(45))[
      THE DN42 TELEPHONE DIRECTORY
    ]

    #block(above: 0.8em, below: 0.8em)[
      #grid(columns: (1fr, auto, 1fr), align: center + horizon, gutter: 5pt)[
        #line(length: 100%, stroke: 0.5pt + luma(100))
      ][
        #text(font: book_font_display, size: 6pt, fill: luma(100))[◆]
      ][
        #line(length: 100%, stroke: 0.5pt + luma(100))
      ]
    ]

    #text(font: book_base_font_serif, size: 8pt)[
      Complete telephone listings for\
      #text(weight: "bold")[the dn42 telephony network]
    ]
    #grid(columns: (1fr, 1fr, 1fr), inset: 0pt, gutter: 5pt, align: center)[
      #box(stroke: 1.5pt + luma(30), inset: (x: 0.4em, y: 0.25em), fill: white)[
        #text(font: book_ad_font_sans_heavy, size: 11pt, fill: luma(20))[SEARCH]
      ]
    ][
      #box(stroke: 1.5pt + luma(30), inset: (x: 0.4em, y: 0.25em), fill: white)[
        #text(font: book_ad_font_sans_heavy, size: 11pt, fill: luma(20))[BROWSE]
      ]
    ][
      #box(stroke: 1.5pt + luma(30), inset: (x: 0.4em, y: 0.25em), fill: white)[
        #text(font: book_ad_font_sans_heavy, size: 11pt, fill: luma(20))[UPDATE]
      ]
    ]
  ]
]
