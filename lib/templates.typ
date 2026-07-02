#import "../variables.typ": *
#import "layout.typ": setpagefooter, setpageheader

#let format-number(number) = {
  let cleaned = number.replace(" ", "")
  if cleaned.starts-with("+042") {
    cleaned = cleaned.slice(4)
    cleaned = cleaned.at(0) + "-" + cleaned.slice(1, 5) + "-" + cleaned.slice(5)
  }
  cleaned
}

#let body-section(numbering-start: false, body) = {
  pagebreak(to: "odd")
  show: doc => setpageheader(doc)
  show: doc => setpagefooter(doc)
  if numbering-start {
    counter(page).update(1)
  }
  
  body
}

#let category-heading(icon-node, title) = {
  heading(level: 2, numbering: none)[
    #icon-node #h(0.5em) #upper(title)
  ]
}

#let directory-entry(
  name,
  line-before-num: none,
  line-in-num: none,
  line-after-num: none,
  primary-number: "",
  additional-numbers: (),
) = {
  let formatted-primary = if primary-number != "" { format-number(primary-number) } else { "" }
  let formatted-additional = additional-numbers.map(phone => format-number(phone))
  block(width: 100%, breakable: false)[
    #text(weight: "medium", size: 10pt, hyphenate: true, smallcaps(name))
    #if line-before-num != none {
      linebreak()
      text(size: 7pt, fill: luma(60))[#line-before-num]
    }
    #if formatted-primary != "" {
      linebreak()
      text(size: 7pt, fill: luma(60))[#line-in-num]
      box(width: 1fr, text(size: 7pt, repeat[.]))
      text(weight: "medium", size: 9pt, font: book_base_font_number, number-width: "tabular")[#formatted-primary]
    }
    #if line-after-num != none {
      linebreak()
      text(size: 7pt, fill: luma(60))[#line-after-num]
    }
    #for phone in formatted-additional {
      linebreak()
      let label = text(size: 7pt, fill: luma(60), "ALSO")
      label
      box(width: 1fr, text(size: 7pt, repeat[.]))
      text(weight: "medium", size: 8pt, font: book_base_font_number, number-width: "tabular")[#phone]
    }
  ]
  v(1.2em, weak: true)
}

#let phone-entry(entry-name, mnt-name, mnt, number, has-sms: false, lang-code: "") = {
  let display-name = entry-name
  if has-sms {
    display-name += " " + type-icon-map.sms
  }
  if lang-code != "" and lang-code != "und" {
    display-name += box(width: 1fr)
    display-name += text(size: 7pt, weight: "light", "[" + lang-code + "]")
  }

  let detail = if mnt-name != "" { mnt-name } else { mnt }

  directory-entry(
    display-name,
    line-in-num: detail,
    primary-number: number,
  )
}

#let noc-entry(entry-name, id, phones, email: none) = {
  let detail-lines = (id,)
  let detail-1 = if email != none { "Email: " + email } else { id }

  directory-entry(
    entry-name,
    line-in-num: id,
    line-before-num: if email != none { "Email: " + email } else { none },
    primary-number: phones.at(0, default: ""),
    additional-numbers: phones.slice(1),
  )
}

#let icon-list-item(icon-key, text-content) = {
  type-icon-map.at(icon-key) + [ ] + text-content
}

#let language-code-table() = {
  table(
    columns: (auto, 1fr, auto, 1fr),
    stroke: none,
    row-gutter: 0.3em,
    ..language-codes.flatten()
  )
}

#let placeholder-page(alignment) = {
  v(1fr)
  align(alignment)[
    #image("/assets/dn42-full.svg", width: 120pt)
  ]
}
