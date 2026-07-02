#import "../../variables.typ": *

#block(
  width: 100%,
  stroke: (top: 4pt + luma(20), bottom: 4pt + luma(20), left: 1pt + luma(60), right: 1pt + luma(60)),
  fill: luma(252),
  inset: (top: 1.5em, bottom: 1.5em, left: 0.8em, right: 0.8em),
  breakable: false,
)[
  #align(center)[
    #text(font: book_ad_font_sans_heavy, size: 22pt, fill: luma(15))[
      ADVERTISE HERE!
    ]
    #v(4pt, weak: true)
    #text(font: book_ad_font_slab, size: 12pt, weight: 400, fill: luma(40))[
      FREE RESERVATION
    ]
    #linebreak()
    #text(font: book_base_font_serif, size: 8pt, fill: luma(50), style: "italic")[
      Promote your service to thousands\
      of DN42 network operators
    ]
    #box(
      stroke: 1.5pt + luma(10),
      inset: (x: 0.6em, y: 0.3em),
      fill: luma(240),
    )[
      #text(font: book_ad_font_sans_heavy, size: 12pt, fill: luma(10))[
        DNC (DN Coin) ACCEPTED
      ]
    ]
    #text(font: book_ad_font_script, size: 12pt, fill: luma(30))[
      Inquiries: ads\@yp.dn42
    ]
  ]
]
