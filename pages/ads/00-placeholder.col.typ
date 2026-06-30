#import "../../variables.typ": *

#block(
  width: 100%,
  stroke: (top: 1.5pt + luma(60), bottom: 1.5pt + luma(60), left: 1pt + luma(80), right: 1pt + luma(80)),
  fill: luma(252),
  inset: (top: 1em, bottom: 1em, left: 0.8em, right: 0.8em),
  breakable: false,
)[
  #align(center)[
    #text(font: book_font_display, size: 8pt, fill: luma(100))[
      ❧ ❧ ❧
    ]
    #text(font: book_font_display, size: 20pt, weight: 800, fill: luma(15))[
      ADVERTISE\ HERE!
    ]
    #linebreak()
    #text(font: book_base_font_sans, size: 12pt, weight: 600, fill: luma(40))[
      FREE RESERVATION
    ]
    #linebreak()
    #text(font: book_base_font_serif, size: 7.5pt, fill: luma(50))[
      Promote your service to thousands\
      of DN42 network operators
    ]
    #linebreak()
    #box(
      stroke: 0.5pt + luma(100),
      inset: (x: 0.5em, y: 0.2em),
      fill: luma(240),
    )[
      #text(font: book_base_font_serif, size: 9pt, weight: "bold", fill: luma(30))[
        DNC (DN Coin) Accepted
      ]
    ]
    #linebreak()
    #text(font: book_base_font_sans, size: 7pt, weight: 500, fill: luma(70))[
      Inquiries: ads\@yp.dn42
    ]
    #linebreak()
    #text(font: book_font_display, size: 8pt, fill: luma(100))[
      ❧ ❧ ❧
    ]
  ]
]
