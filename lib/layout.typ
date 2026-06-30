#import "../variables.typ": *

#let setpage(doc) = {
  set page(
    paper: "a5",
  )

  // main body font
  set text(
    font: book_base_font_serif,
    size: book_base_font_size,
    lang: "en",
  )

  // headings
  show heading: set block(above: 1.8em, below: 1.2em)
  show heading: set text(weight: "bold", font: book_base_font_sans)

  // l2 headings
  show heading.where(level: 2): it => block(
    width: 100%,
    stroke: (bottom: 1.5pt + black),
    inset: (bottom: 4pt),
    above: 1.8em,
    below: 1.2em,
    align(left)[#text(size: 11pt, weight: "bold", tracking: 1pt, font: book_base_font_sans)[#it.body]],
  )

  doc
}

#let setpagefooter(doc) = {
  set page(
    footer: [
      #line(length: 100%, stroke: 0.5pt)
      #align(center)[
        #context text(size: 11pt, weight: "bold")[\- #counter(page).display() -]
      ]
    ],
  )

  doc
}

#let setpageheader(doc) = {
  set page(
    header: [
      #align(center)[
        #text(size: 8pt, tracking: 1pt, weight: "bold", font: book_base_font_sans)[#book_title #book_subtitle]
        #v(2pt)
        #line(length: 100%, stroke: 0.5pt)
      ]
    ],
  )

  doc
}
