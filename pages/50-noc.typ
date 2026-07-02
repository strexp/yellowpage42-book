#import "@preview/iconify:0.5.3": icon
#import "../lib/templates.typ": body-section, category-heading, noc-entry

#body-section(
  [
    #v(1em)

    #let noc-data = json("/assets/data-noc.json")

    #columns(2)[
      #heading(numbering: none)[NOC Directory]
      // Persons Section
      #category-heading(icon("mdi:account", width: 1em, y: -1.5pt), "Persons")

      #for person in noc-data.persons {
        noc-entry(
          person.at("name", default: "Unknown"),
          person.at("id", default: ""),
          person.at("phones", default: ()),
          email: person.at("email", default: none),
        )
      }

      #v(2em, weak: true)

      // Organisations Section
      #category-heading(icon("mdi:office-building", width: 1em, y: -1.5pt), "Organisations")

      #for org in noc-data.organisations {
        noc-entry(
          org.at("name", default: "Unknown"),
          org.at("id", default: ""),
          org.at("phones", default: ()),
          email: org.at("email", default: none),
        )
      }
    ]
  ],
)
