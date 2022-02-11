#
# aarossig.net build
#

# Config #######################################################################

# List of markdown files to generate pages for.
MARKDOWN = src/about.md \
		src/index.md \
		src/links.md

# Page titles.
TITLE_about = about
TITLE_index = home
TITLE_links = links

# List of images to bundle into the output.
IMG = src/res/about/aarossig_google_2014.jpg \
		src/res/about/aarossig_photo_2020.jpg \
		src/res/about/android_oreo.jpg \
		src/res/about/deltabot_debug.jpg \
		src/res/about/norway_fjorde.jpg \
		src/res/index/lick_observatory.jpg

# List of resources to bundle into the output.
RES = src/res/css/main.css

# Web Variables ################################################################

WEBVAR_CURRENT_YEAR = $(shell date +%Y)
WEBVAR_CURRENT_DATETIME = $(shell date)

# Build ########################################################################

# Declare the output directory to produce the final result in.
OUT = out

# Generated merged markdown with footer and headers.
MARKDOWN_OUT = $(patsubst %.md, $(OUT)/merged/%.md, $(MARKDOWN))

# The final HTML outputs.
HTML_OUT = $(patsubst $(OUT)/merged/src/%.md, $(OUT)/www/%.html, $(MARKDOWN_OUT))

# The final image outputs.
IMG_OUT = $(patsubst src/%, $(OUT)/www/%, $(IMG))

# The final css outputs.
RES_OUT = $(patsubst src/%, $(OUT)/www/%, $(RES))

# Process each markdown file.
$(OUT)/merged/%.md: %.md src/header.md src/footer.md
	mkdir -p $(dir $@)
	cat src/header.md > $@
	echo >> $@
	cat $< >> $@
	echo >> $@
	cat src/footer.md >> $@
	sed -i 's/WEBVAR-CURRENT-YEAR/$(WEBVAR_CURRENT_YEAR)/g' $@
	sed -i 's/WEBVAR-CURRENT-DATETIME/$(WEBVAR_CURRENT_DATETIME)/g' $@
	sed -i "s/WEBVAR-PAGE-LAST-MODIFIED/$$(date -d @$$(git log -1 --pretty='format:%at' $<))/g" $@

# Generate HTML files.
$(HTML_OUT): $(OUT)/www/%.html: $(OUT)/merged/src/%.md src/header.html \
	                              src/footer.html src/res/css/main.css
	mkdir -p $(dir $@)
	cat src/header.html > $@
	markdown --html4tags $< >> $@
	cat src/footer.html >> $@
	sed -i 's/WEBVAR-TITLE/$(TITLE_$(patsubst %.html,%,$(notdir $@)))/g' $@

# Stage images.
$(IMG_OUT): $(OUT)/www/%: src/%
	./tools/generate_images.sh $< $(dir $@)

# Stage resources.
$(RES_OUT): $(OUT)/www/%: src/%
	mkdir -p $(dir $@)
	cp $< $@

.PHONY:
all: $(HTML_OUT) $(IMG_OUT) $(RES_OUT)
