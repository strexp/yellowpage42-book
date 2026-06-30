#import "../variables.typ": book_ad_list, book_ad_min_interval, book_ad_show, type-icon-map
#import "../lib/templates.typ": body-section, category-heading, phone-entry

#body-section(
  "Categorized Directory",
  numbering-start: true,
  [
    #v(1em)

    #let raw-data = json("/assets/data.json")

    #columns(2)[
      #let unique-types = raw-data.map(e => e.at("type", default: "other")).dedup().sorted()

      // ADs variables
      #let enabled-ads = if book_ad_show { book_ad_list } else { () }
      #let last-ad-position = -book_ad_min_interval
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
          let should-insert-ad = (
            enabled-ads.len() > 0
              and (current-global-index - last-ad-position) >= book_ad_min_interval
              and calc.rem(current-global-index, 4) == 0
          )
          if should-insert-ad {
            let ad-path = enabled-ads.at(calc.rem(ad-index, enabled-ads.len()))
            include "../pages/ads/" + ad-path
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
  ]
)
