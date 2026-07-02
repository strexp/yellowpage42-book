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
    #text(font: book_base_font_sans, size: 8pt, weight: 700)[
      #box(width: 1fr, repeat(justify: false)[═])
      NETWORK SERVICES
      #box(width: 1fr, repeat(justify: false)[═])
    ]
    #text(font: book_font_display, size: 16pt, weight: 800, fill: luma(15))[
      NIANTIC
    ]
    #text(font: book_font_display, size: 14pt, weight: 700, fill: luma(20))[
      NETWORK
    ]
    #box(
      stroke: 1pt + luma(60),
      fill: luma(245),
      inset: (x: 0.8em, y: 0.25em),
      radius: 1pt,
    )[
      #text(size: 9pt, weight: "bold", fill: luma(30))[
        AS 4242421331
      ]
    ]
    #linebreak()
    #text(font: book_base_font_serif, size: 8pt, weight: 700, fill: luma(30))[
      NOW ACCEPTING PEERING
    ]
    #text(font: book_base_font_serif, size: 8pt, style: "italic", fill: luma(70))[
      IPv6 Transit Available
    ]
    #linebreak()
    #text(font: book_base_font_sans, size: 10pt, weight: 600, fill: luma(50))[
      #box(width: 1fr, repeat(justify: false)[\~])
      PEERING REQUESTS
      #box(width: 1fr, repeat(justify: false)[\~])
    ]
    #linebreak()
    #text(size: 10pt, weight: 500, fill: luma(35), number-width: "tabular")[
      peering\@nia.dn42\ 
      +042 4 0803 9904
    ]
  ]
]
