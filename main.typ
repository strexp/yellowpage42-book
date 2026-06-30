#import "variables.typ": *

#import "lib/layout.typ": setpage
#import "lib/meta.typ": apply-metadata
#import "@preview/iconify:0.5.3": provide-icons

#show: doc => apply-metadata(doc)
#show: doc => setpage(doc)

#provide-icons(json("/assets/icons-mdi.json"))

#include "pages/00-cover.typ"
#include "pages/10-copyright.typ"
#include "pages/20-toc.typ"
#include "pages/30-foreword.typ"
#include "pages/40-directory.typ"
#include "pages/50-noc.typ"
#include "pages/80-appendix.typ"
#include "pages/99-back-cover.typ"
