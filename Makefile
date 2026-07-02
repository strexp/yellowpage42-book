.PHONY: all sync icon fonts build watch clean a4

FONT_BASE := https://github.com/google/fonts/raw/refs/heads/main

FONTS_LIST := \
	ofl/fraunces/Fraunces%5BSOFT,WONK,opsz,wght%5D.ttf:Fraunces.ttf \
	ofl/fraunces/Fraunces-Italic%5BSOFT,WONK,opsz,wght%5D.ttf:Fraunces-Italic.ttf \
	ofl/archivonarrow/ArchivoNarrow%5Bwght%5D.ttf:ArchivoNarrow.ttf \
	ofl/newsreader/Newsreader%5Bopsz,wght%5D.ttf:Newsreader.ttf \
	ofl/newsreader/Newsreader-Italic%5Bopsz,wght%5D.ttf:Newsreader-Italic.ttf \
	ofl/notoemoji/NotoEmoji%5Bwght%5D.ttf:NotoEmoji.ttf \
	ofl/notoserifsc/NotoSerifSC%5Bwght%5D.ttf:NotoSerifSC.ttf \
	ofl/notoseriftc/NotoSerifTC%5Bwght%5D.ttf:NotoSerifTC.ttf

# Default target
all: fonts build

# Sync latest data
sync:
	[ -f assets/data.json ] || wget 'https://yp.dn42/api/public/phonebook/download?format=json' -O assets/data.json

# Download icon data
icon:
	[ -f assets/icons-mdi.json ] || wget 'https://raw.githubusercontent.com/iconify/icon-sets/master/json/mdi.json' -O assets/icons-mdi.json

# Download fonts
fonts:
	@mkdir -p fonts
	@for item in $(FONTS_LIST); do \
	    url="$(FONT_BASE)/$${item%:*}"; \
		file="$${item#*:}"; \
		if [ ! -f "fonts/$$file" ]; then \
			echo "Downloading $$file ..."; \
			wget -q -O "fonts/$$file" "$$url"; \
		fi; \
	done

# Build the PDF
build: sync icon fonts
	typst compile --font-path fonts main.typ

# Watch for changes and rebuild automatically
watch: sync icon fonts
	typst watch --font-path fonts main.typ

# Generate A4 printable PDF
a4: build
	python utils/a5_to_a4_booklet.py main.pdf main_a4_print.pdf
	
# Clean generated files
clean:
	rm -f main.pdf main_a4_print.pdf
	rm -f assets/data.json assets/icons-mdi.json
	rm -f fonts/*.ttf
