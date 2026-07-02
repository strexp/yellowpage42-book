#import "../variables.typ": *

#pagebreak(to: "odd")
#set page(numbering: none)

#v(1fr)
#block(width: 100%, stroke: (left: 3pt + black), inset: (left: 12pt))[
  #text(size: 14pt, weight: "bold", font: book_font_display, upper([#book_title\ #book_subtitle])) \
  #v(0.5em)
  Published by #book_author \
  #book_author_dep \ \
  Copyright #sym.copyright #datetime.today().year() #book_author.
  Licensed under #book_license. Some Rights Reserved. \
  #text(size: 20pt, book_license_mark)

  #v(1em)
  This publication is distributed free of charge as a public service to the dn42 community.

  #v(1em)
  *DATA SOURCE NOTICE:* \
  This public directory is compiled automatically from YellowPage42#sym.trademark, a third-party directory service operating on the dn42 network. It is distributed as a public utility for the benefit of all network participants.

  *DISCLAIMER OF LIABILITY:* \
  Automatically generated content may not always be accurate, complete, or up-to-date. While every effort has been made to ensure the accuracy of the entries, #book_author accepts no liability for any omissions, errors, or inaccuracies in the phone number records. Users are advised to verify critical information independently.

  #v(1em)
  *SOURCE CODE:* \
  The source code for generating this directory is available at: \
  #h(2em) #text(book_source)

  *TELEPHONY DATA:* \
  The source of telephone directory data is available at: \
  #h(2em) #text(book_data_source)
]

#pagebreak()
