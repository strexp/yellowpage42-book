#import "../../variables.typ": *

#block(
  width: 100%,
  stroke: 1pt + luma(70),
  fill: luma(250),
  inset: (top: 0.9em, bottom: 0.9em, left: 0.8em, right: 0.8em),
  radius: 2pt,
  breakable: false,
)[
  #align(center)[
    #box(width: 100%, fill: luma(80), inset: 0.3em)[
      #text(font: book_base_font_sans, size: 9pt, weight: 600, fill: white)[
        ESTABLISHED 2026
      ]
    ]
    #text(font: book_font_display, size: 18pt, weight: 800, fill: luma(20))[
      yp.dn42
    ]
    #v(1pt)
    #text(font: book_base_font_sans, size: 9pt, weight: 600, fill: luma(45))[
      THE DN42 TELEPHONE DIRECTORY
    ]
    #block(above: 0.5em, below: 0.5em)[
      #grid(columns: (1fr, auto, 1fr), align: center + horizon)[
        #line(length: 100%, stroke: 0.5pt + luma(100))
      ][
        #text(font: book_font_display, size: 6pt, fill: luma(100))[◆]
      ][
        #line(length: 100%, stroke: 0.5pt + luma(100))
      ]
    ]
    #text(font: book_base_font_serif, size: 8pt)[
      Complete telephone listings for
    ]
    #text(font: book_base_font_serif, size: 8pt, weight: 600)[
      the dn42 telephony network
    ]
    #block(above: 0.5em, below: 0.5em)[
      #grid(columns: (auto, auto, auto), inset: 0pt, gutter: 0pt)[
        #box(stroke: 0.5pt + luma(120), inset: (x: 0.4em, y: 0.15em))[
          #text(font: book_base_font_sans, size: 8pt, fill: luma(60))[SEARCH]
        ]
        #box(stroke: 0.5pt + luma(120), inset: (x: 0.4em, y: 0.15em))[
          #text(font: book_base_font_sans, size: 8pt, fill: luma(60))[BROWSE]
        ]
        #box(stroke: 0.5pt + luma(120), inset: (x: 0.4em, y: 0.15em))[
          #text(font: book_base_font_sans, size: 8pt, fill: luma(60))[UPDATE]
        ]
      ]
    ]
    #text(font: book_base_font_serif, size: 7pt, style: "italic", fill: luma(80))[
      Your Connection Starts Here
    ]
  ]
]
