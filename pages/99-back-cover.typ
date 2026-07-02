#import "@preview/tiaoma:0.3.0"
#import "@preview/ccicons:1.0.1": *
#import "../variables.typ": *

#pagebreak(to: "odd")
#v(1fr)
#align(center)[
  #text(size: 18pt, weight: "bold", "[END OF DIRECTORY]")
]
#pagebreak(to: "even")
#set page(fill: none, margin: 0mm, numbering: none, header: none, footer: none)

#align(center + horizon)[
  #box(width: 85%, height: 90%, stroke: 2pt + black, inset: 20pt)[
    #v(2em)
    #image("/assets/dn42.svg", width: 90pt)
    #v(1.5em)

    #text(size: 22pt, weight: "bold", tracking: 1pt, font: book_font_display)[#upper(book_title)] \
    #text(size: 16pt, weight: "bold", tracking: 1pt, font: book_font_display)[#upper(book_subtitle)] \

    #v(1em)
    #text(
      size: 14pt,
      style: "italic",
      font: book_base_font_sans,
    )[#book_author\ #book_author_dep] \

    #v(3em)

    #block(width: 100%, stroke: 0.5pt, inset: 15pt, fill: luma(250))[
      #set text(size: 10pt)
      #align(center)[
        For more information about the dn42 network and how to join, please visit #text(fill: blue.darken(30%))[https://wiki.dn42.dev]
      ]
    ]

    #v(4em)

    #grid(
      columns: (1.5fr, 1fr),
      align: (left + bottom, right + horizon),
      [
        #text(size: 32pt, fill: luma(100), font: book_base_font_sans)[#cc-by-nc-sa] \
        #text(size: 10pt, fill: luma(100), font: book_base_font_sans)[Licensed under CC-BY-NC-SA 4.0] \
        #v(1em)
        #text(size: 12pt, weight: "bold", font: book_base_font_sans)[DISTRIBUTED FREE OF CHARGE]
      ],
      [
        #block(inset: 8pt, fill: white, stroke: 0.5pt)[
          #tiaoma.ean("4242000000000")
          #v(0.3em)
          #text(size: 8pt, number-width: "tabular")[DSBN 424-2-000000-00-0]
        ]
      ],
    )

    #v(3em)
    #text(size: 14pt, weight: "bold", tracking: 2pt, font: book_base_font_sans)[END OF DIRECTORY]
    #v(1em)
  ]
]
