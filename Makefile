#
# aarossig.net build
#

# Config #######################################################################

# List of markdown files to generate pages for.
MARKDOWN = src/about.md \
		src/index.md \
		src/links.md \
		src/projects.md \
		src/ryobi_batteries.md

# Page titles.
TITLE_about = about
TITLE_index = home
TITLE_links = links
TITLE_projects = projects
TITLE_ryobi_batteries = ryobi batteries

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

# The final HTML outputs.
HTML_OUT = $(patsubst src/%.md, $(OUT)/www/%.html, $(MARKDOWN))

# The final image outputs.
IMG_OUT = $(patsubst src/%, $(OUT)/www/%, $(IMG))

# The final css outputs.
RES_OUT = $(patsubst src/%, $(OUT)/www/%, $(RES))

# Generate HTML files.
$(HTML_OUT): $(OUT)/www/%.html: src/%.md src/header.html src/header.md \
	                              src/footer.html src/footer.md src/res/css/main.css
	mkdir -p $(dir $@)
	cat src/header.html > $@
	cmark --to html --unsafe src/header.md >> $@
	cmark --to html --unsafe $< >> $@
	cmark --to html --unsafe src/footer.md >> $@
	cat src/footer.html >> $@
	sed -i 's/WEBVAR-TITLE/$(TITLE_$(patsubst %.html,%,$(notdir $@)))/g' $@
	sed -i 's/WEBVAR-CURRENT-YEAR/$(WEBVAR_CURRENT_YEAR)/g' $@
	sed -i 's/WEBVAR-CURRENT-DATETIME/$(WEBVAR_CURRENT_DATETIME)/g' $@
	sed -i "s/WEBVAR-PAGE-LAST-MODIFIED/$$(date -d @$$(git log -1 --pretty='format:%at' $<))/g" $@

# Generate images.
$(IMG_OUT): $(OUT)/www/%: src/%
	./tools/generate_images.sh $< $(dir $@)

# Stage resources.
$(RES_OUT): $(OUT)/www/%: src/%
	mkdir -p $(dir $@)
	cp $< $@

.PHONY:
all: $(HTML_OUT) $(IMG_OUT) $(RES_OUT)
