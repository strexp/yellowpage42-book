#import "@preview/ccicons:1.0.1": *
#import "@preview/iconify:0.5.3": icon

// Icon mapping for phone types
#let type-icon-map = (
  "phone": icon("mdi:phone", width: 1em, y: -1.5pt),
  "fax": icon("mdi:fax", width: 1em, y: -1.5pt),
  "ivr": icon("mdi:robot-outline", width: 1em, y: -1.5pt),
  "number-readout": icon("mdi:numeric", width: 1em, y: -1.5pt),
  "music": icon("mdi:music", width: 1em, y: -1.5pt),
  "sip": icon("mdi:lan", width: 1em, y: -1.5pt),
  "other": icon("mdi:help-circle-outline", width: 1em, y: -1.5pt),
  "modem": icon("mdi:lan-pending", width: 1em, y: -1.5pt),
  "mobile": icon("mdi:cellphone", width: 1em, y: -1.5pt),
  "voicemail": icon("mdi:voicemail", width: 1em, y: -1.5pt),
  "gateway": icon("mdi:router-network", width: 1em, y: -1.5pt),
  "conference": icon("mdi:account-group", width: 1em, y: -1.5pt),
  "emergency": icon("mdi:alert-circle", width: 1em, y: -1.5pt),
  "echo-test": icon("mdi:phone-return", width: 1em, y: -1.5pt),

  "sms": icon("mdi:message-text-outline", width: 1em, y: -1.5pt),
)

#let language-codes = (
  ("mul", "Multiple languages"),
  ("eng", "English"),
  ("cmn", "Mandarin Chinese"),
  ("yue", "Cantonese"),
  ("nan", "Min Nan"),
  ("jpn", "Japanese"),
  ("kor", "Korean"),
  ("rus", "Russian"),
  ("deu", "German"),
  ("fra", "French"),
  ("ita", "Italian"),
  ("spa", "Spanish"),
  ("por", "Portuguese"),
  ("msa", "Malay"),
  ("vie", "Vietnamese"),
  ("hin", "Hindi"),
  ("ben", "Bengali"),
  ("fas", "Persian"),
  ("tur", "Turkish"),
  ("tha", "Thai"),
  ("jav", "Javanese"),
  ("und", "Unknown"),
  ("mis", "Uncoded"),
)

#let book_title = "Public Telephone Directory"
#let book_subtitle = "of dn42 Telephony Network"
#let book_author = "dn42 Foundation"
#let book_author_dep = "Department of Global Network Registry"
#let book_license = "CC BY-NC-SA 4.0"
#let book_license_mark = cc-by-nc-sa
#let book_source = "https://github.com/strexp/yellowpage42-book"
#let book_data_source = "https://yp.dn42"

// Directory & Body Text
#let book_base_font_serif = ("Newsreader 16pt", "Noto Serif SC", "Noto Serif TC", "Noto Emoji")
// Front Matter & Headers
#let book_base_font_sans = "Archivo Narrow"
// Phone Number
#let book_base_font_number = book_base_font_serif
// Cover & Display
#let book_font_display = "Fraunces"

#let book_base_font_size = 10pt

#let book_ad_show = true
#let book_ad_list = (
  "00-placeholder.col.typ",
  "10-service-promo.col.typ",
  "20-tech-support.col.typ",
)
#let book_ad_min_interval = 10
