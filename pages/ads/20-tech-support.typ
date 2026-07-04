#import "../../variables.typ": *

// Returns the ad content as a block that can be placed with place(float: true)
#let ad-content = block(
  width: 100%,
  stroke: (left: 4pt + luma(40), top: 1pt + luma(60), bottom: 1pt + luma(60), right: 1pt + luma(60)),
  fill: luma(248),
  inset: (top: 1em, bottom: 1em, left: 1em, right: 0.8em),
)[
  #align(left)[
    #align(center)[
      #text(font: book_ad_font_tech, size: 9pt, weight: 700)[
        #box(width: 1fr, repeat(justify: false)[=])
        NETWORK SERVICES
        #box(width: 1fr, repeat(justify: false)[=])
      ]
    ]
    #v(-1.5em)
    #text(font: book_ad_font_tech, size: 24pt, weight: 800, fill: luma(15))[
      > NIANTIC
    ]
    #v(-1.5em)
    #text(font: book_ad_font_tech, size: 20pt, weight: 700, fill: luma(50))[
      #h(1em) NETWORK\_
    ]
    #v(-1.5em)
    #align(center)[
      #text(font: book_ad_font_tech, size: 10pt, weight: "bold", fill: luma(10))[
        AS 4242421331
      ]\
      #text(font: book_ad_font_tech, size: 8pt, fill: luma(60))[
        [ IPv6 Transit Available ]
      ]
      #linebreak()
      #text(font: book_ad_font_slab, size: 11pt, fill: luma(20))[
        ACCEPTING PEERING
      ]
      #linebreak()
      #text(font: book_ad_font_tech, size: 11pt, fill: luma(20))[
        peering\@nia.dn42\
        +042 4 0803 9904
      ]
    ]
  ]
]
