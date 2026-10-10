#import "../../variables.typ": *

#let ad-content = block(
  width: 100%,
  stroke: (left: 4pt + luma(30), top: 1pt + luma(70), bottom: 1pt + luma(70), right: 1pt + luma(70)),
  fill: luma(248),
  inset: (top: 1em, bottom: 1em, left: 1em, right: 1em),
)[
  #align(left)[
    #align(center)[
      #text(font: book_ad_font_tech, size: 9pt, weight: 700)[
        #box(width: 1fr, repeat(justify: false)[-])
        GLOBAL BACKBONE PROVIDER
        #box(width: 1fr, repeat(justify: false)[-])
      ]
    ]

    #v(-2em)

    #text(font: book_ad_font_sans_heavy, size: 22pt, fill: luma(10))[
      SESSNETWORK
    ]

    #v(-1.7em)

    #text(font: book_ad_font_tech, size: 10pt, fill: luma(40))[
      AS 4242422466 
    ]

    #v(-0.5em)

    #text(font: book_base_font_serif, size: 8pt)[
      Next Generation Interconnected Network Without Border.
    ]

    #block(above: 0.5em, below: 0.5em)[
      #grid(columns: (1fr, auto, 1fr), align: center + horizon, gutter: 5pt)[
        #line(length: 100%, stroke: 0.5pt + luma(100))
      ][
        #text(font: book_font_display, size: 6pt, fill: luma(100))[◆]
      ][
        #line(length: 100%, stroke: 0.5pt + luma(100))
      ]
    ]

    #text(font: book_ad_font_slab, size: 8pt)[
      SERVICES
    ]

    #v(-0.5em)

    #text(font: book_base_font_serif, size: 8pt)[
      IP Transit · IX Port · L2 Ethernet\
      Minecraft · NTP S1/2/3 · Servers
    ]

    #v(-0.2em)

    #align(center)[
      #text(font: book_base_font_serif, size: 8pt)[
        #type-icon-map.at("gateway") https://sess.dn42\
        #type-icon-map.at("sms") sales\@sess.dn42\
        #type-icon-map.at("phone") +042-4-2466-0000\
      ]
    ]
  ]
]
