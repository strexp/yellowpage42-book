#import "../variables.typ": type-icon-map
#import "../lib/templates.typ": body-section, category-heading, phone-entry
#import "../lib/ads.typ": get-ad-by-index, insert-floating-ad, ad-min-interval, ad-show

#body-section(
  numbering-start: true,
  [
    #v(1em)

    #let raw-data = json("/assets/data.json")

    #columns(2)[
      #heading(numbering: none)[Categorized Directory]

      #let unique-types = raw-data.map(e => e.at("type", default: "other")).dedup().sorted()

      // ADs variables
      #let last-ad-position = -ad-min-interval
      #let ad-index = 0
      #let global-entry-index = 0

      #for type-name in unique-types {
        let icon-node = type-icon-map.at(type-name, default: type-icon-map.at("other"))

        category-heading(icon-node, type-name)

        let items = raw-data.filter(e => e.at("type", default: "other") == type-name)
        let sorted-items = items.sorted(key: e => e.at("name", default: ""))

        // ADs logic
        for (item-index, entry) in sorted-items.enumerate() {
          let current-global-index = global-entry-index + item-index
          let is-category-start = item-index < 2
          let should-insert-ad = (
            ad-show
              and not is-category-start
              and (current-global-index - last-ad-position) >= ad-min-interval
              and calc.rem(current-global-index, 4) == 0
          )
          if should-insert-ad {
            let ad-content = get-ad-by-index(ad-index)
            insert-floating-ad(ad-content)
            ad-index += 1
            last-ad-position = current-global-index
          }

          phone-entry(
            entry.at("name", default: "Unknown"),
            entry.at("mntName", default: ""),
            entry.at("mnt", default: ""),
            entry.at("number", default: ""),
            has-sms: entry.at("sms", default: 0) != 0,
            lang-code: entry.at("language", default: "und"),
          )
        }
        global-entry-index += sorted-items.len()
        v(2em, weak: true)
      }
    ]
  ],
)
