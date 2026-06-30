# Font URLs
FONT_FRAUNCES_URL := https://github.com/google/fonts/raw/refs/heads/main/ofl/fraunces/Fraunces%5BSOFT,WONK,opsz,wght%5D.ttf
FONT_FRAUNCES_ITALIC_URL := https://github.com/google/fonts/raw/refs/heads/main/ofl/fraunces/Fraunces-Italic%5BSOFT,WONK,opsz,wght%5D.ttf
FONT_LEXEND_URL := https://github.com/google/fonts/raw/refs/heads/main/ofl/lexend/Lexend%5Bwght%5D.ttf
FONT_NEWSREADER_URL := https://github.com/google/fonts/raw/refs/heads/main/ofl/newsreader/Newsreader%5Bopsz,wght%5D.ttf
FONT_NEWSREADER_ITALIC_URL := https://github.com/google/fonts/raw/refs/heads/main/ofl/newsreader/Newsreader-Italic%5Bopsz,wght%5D.ttf
FONT_SPACE_MONO_URL := https://github.com/google/fonts/raw/refs/heads/main/ofl/spacemono/SpaceMono-Regular.ttf
FONT_NOTO_EMOJI_URL := https://github.com/google/fonts/raw/refs/heads/main/ofl/notoemoji/NotoEmoji%5Bwght%5D.ttf
FONT_NOTO_SERIF_SC_URL := https://github.com/google/fonts/raw/refs/heads/main/ofl/notoserifsc/NotoSerifSC%5Bwght%5D.ttf
FONT_NOTO_SERIF_TC_URL := https://github.com/google/fonts/raw/refs/heads/main/ofl/notoseriftc/NotoSerifTC%5Bwght%5D.ttf

.PHONY: all sync icon fonts build watch clean

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
	mkdir -p fonts
	[ -f fonts/Fraunces.ttf ] || wget '$(FONT_FRAUNCES_URL)' -O fonts/Fraunces.ttf
	[ -f fonts/Fraunces-Italic.ttf ] || wget '$(FONT_FRAUNCES_ITALIC_URL)' -O fonts/Fraunces-Italic.ttf
	[ -f fonts/Lexend.ttf ] || wget '$(FONT_LEXEND_URL)' -O fonts/Lexend.ttf
	[ -f fonts/Newsreader.ttf ] || wget '$(FONT_NEWSREADER_URL)' -O fonts/Newsreader.ttf
	[ -f fonts/Newsreader-Italic.ttf ] || wget '$(FONT_NEWSREADER_ITALIC_URL)' -O fonts/Newsreader-Italic.ttf
	[ -f fonts/SpaceMono-Regular.ttf ] || wget '$(FONT_SPACE_MONO_URL)' -O fonts/SpaceMono-Regular.ttf
	[ -f fonts/NotoEmoji.ttf ] || wget '$(FONT_NOTO_EMOJI_URL)' -O fonts/NotoEmoji.ttf
	[ -f fonts/NotoSerifSC.ttf ] || wget '$(FONT_NOTO_SERIF_SC_URL)' -O fonts/NotoSerifSC.ttf
	[ -f fonts/NotoSerifTC.ttf ] || wget '$(FONT_NOTO_SERIF_TC_URL)' -O fonts/NotoSerifTC.ttf

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
	rm -f main.pdf
	rm -f assets/data.json assets/icons-mdi.json
	rm -f fonts/*.ttf
