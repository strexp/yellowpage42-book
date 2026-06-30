#import "@preview/datify:1.0.1": *
#import "../variables.typ": *
#import "../lib/templates.typ": placeholder-page

#set page(margin: 10mm)
#align(center + horizon)[
  #box(width: 100%, height: 96%, stroke: 4pt + black, inset: 4pt)[
    #box(width: 100%, height: 100%, stroke: 1pt + black, inset: 15pt)[

      #align(left)[
        #text(size: 10pt, weight: "bold", tracking: 1pt, upper("For dn42 Telephony Network Users"))\
        #text(
          size: 10pt,
        )[Data extracted from YellowPage42#sym.trademark]
      ]

      #v(3em)

      // dn42 Official Logo
      #image("/assets/dn42.svg", width: 120pt)

      #v(3em)
      #text(size: 32pt, weight: "black", tracking: 3pt, font: book_font_display, upper(book_title)) \ \ \
      #text(size: 18pt, weight: "bold", tracking: 1pt, font: book_font_display, upper(book_subtitle))

      #v(1fr)

      #text(size: 12pt, weight: "bold", font: book_base_font_sans, book_author) \
      #text(size: 10pt, style: "italic", font: book_base_font_sans, book_author_dep)

      #v(2em)
      #line(length: 100%, stroke: 1.5pt)
      #v(0.5em)

      #text(
        size: 14pt,
        weight: "bold",
        tracking: 1pt,
        font: book_base_font_sans,
        upper([EDITION #custom-date-format(datetime.today(), pattern: "MMMM yyyy")]),
      )

      #v(0.5em)
    ]
  ]
]

#pagebreak()
#placeholder-page(left + bottom)
