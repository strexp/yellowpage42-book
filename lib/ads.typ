#import "../variables.typ": book_ad_show, book_ad_min_interval

#import "../pages/ads/00-placeholder.typ" as ad-placeholder
#import "../pages/ads/10-service-promo.typ" as ad-service
#import "../pages/ads/20-tech-support.typ" as ad-tech

#let book_ad_list = (
  ad-placeholder,
  ad-service,
  ad-tech,
)

#let get-ad-by-index(ad-index) = {
  let enabled-ads = if book_ad_show { book_ad_list } else { () }
  if enabled-ads.len() == 0 {
    return none
  }

  let offset = calc.rem(ad-index * 7, enabled-ads.len())
  let ad-module = enabled-ads.at(calc.rem(ad-index + offset, enabled-ads.len()))
  ad-module.ad-content
}

#let insert-floating-ad(ad-content) = {
  if ad-content != none {
    place(
      auto,
      float: true,
      scope: "column",
      clearance: 0.8em,
      ad-content
    )
  }
}

#let ad-list = book_ad_list
#let ad-min-interval = book_ad_min_interval
#let ad-show = book_ad_show
