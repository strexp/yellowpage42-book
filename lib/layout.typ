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
  show heading: set text(weight: "bold", font: book_base_font_sans, size: 18pt)

  // l2 headings
  show heading.where(level: 2): it => block(
    width: 100%,
    stroke: (bottom: 1.5pt + black),
    inset: (bottom: 4pt),
    above: 0.5em,
    below: 0.8em,
    align(left)[#text(size: 12pt, weight: "bold", tracking: 1pt, font: book_base_font_sans)[#it.body]],
  )

  doc
}

#let setpagefooter(doc) = {
  set page(
    footer: context {
      let page-num = counter(page).get().first()
      let align-dir = if calc.rem(page-num, 2) == 0 { left } else { right }
      align(align-dir)[
        #line(length: 100%, stroke: 0.5pt)
        #context text(size: 11pt, weight: "bold")[#counter(page).display()]
      ]
    },
  )

  doc
}

#let setpageheader(doc) = {
  set page(
    header: context {
      let page-num = counter(page).get().first()
      let align-dir = if calc.rem(page-num, 2) == 0 { left } else { right }
      align(align-dir)[
        #text(size: 9pt, font: book_base_font_sans)[#book_title #book_subtitle]
        #line(length: 100%, stroke: 0.5pt)
      ]
    },
  )

  doc
}
