#import "../variables.typ": *

#let pdf-publisher = book_author
#let pdf-copyright = "Copyright (c) " + str(datetime.today().year()) + " " + book_author + ". Licensed under " + book_license
#let pdf-subject = "A comprehensive directory of telephone numbers in the dn42 network"

#let set-document-metadata(doc) = {
  set document(
    title: [#book_title #book_subtitle],
    author: book_author,
    keywords: (
      "telephone directory",
      "dn42",
      "telephony",
      "phone numbers",
      "network directory",
      "YellowPage42",
    ),
    date: datetime.today(),
  )
  doc
}

#let set-extended-metadata() = {
  metadata("Public Telephone Directory of dn42 Telephony Network")
  metadata(book_author)
  metadata(datetime.today().display())
  metadata("telephone directory, dn42, telephony, phone numbers, network directory, YellowPage42")
  metadata("en")
  metadata("Directory")
  metadata(book_license)
  metadata("A comprehensive telephone directory for the dn42 network")
  metadata(book_source)
}

#let apply-metadata(doc) = {
  set-extended-metadata()
  set-document-metadata(doc)
}
