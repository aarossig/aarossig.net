#
# aarossig.net build
#

# Config #######################################################################

# List of markdown files to generate pages for.
MARKDOWN = src/about.md \
		src/index.md \
		src/links.md \
		src/projects.md \
		src/retro_computing.md \
		src/ryobi_index.md \
		src/ryobi_water_boiler.md

# Page titles.
TITLE_about = about
TITLE_index = home
TITLE_links = links
TITLE_projects = projects
TITLE_ryobi_index = ryobi tools/batteries
TITLE_ryobi_water_boiler = ryobi water boiler

# List of images to bundle into the output.
IMG = src/res/about/aarossig_google_2014.jpg \
		src/res/about/aarossig_photo_2020.jpg \
		src/res/about/android_oreo.jpg \
		src/res/about/deltabot_debug.jpg \
		src/res/about/norway_fjorde.jpg \
		src/res/index/lick_observatory.jpg \
    src/res/projects/retro/windows_95_windows_folder.png \
		src/res/projects/ryobi/kettle.jpg \
		src/res/projects/ryobi/kettle_upgraded.jpg \
    src/res/projects/ryobi/power_meter.jpg \
		src/res/projects/ryobi/tea_mug.jpg \
		src/res/projects/ryobi/water_boiler_setup.jpg \
		src/res/projects/ryobi/PBP004.jpg \
		src/res/projects/ryobi/PBP007.jpg \
		src/res/projects/ryobi/P194.jpg

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
	sed -i 's#WEBVAR-TITLE#$(TITLE_$(patsubst %.html,%,$(notdir $@)))#g' $@
	sed -i 's/WEBVAR-CURRENT-YEAR/$(WEBVAR_CURRENT_YEAR)/g' $@
	sed -i 's/WEBVAR-CURRENT-DATETIME/$(WEBVAR_CURRENT_DATETIME)/g' $@
	sed -i "s/WEBVAR-PAGE-LAST-MODIFIED/$$(date -d @$$(git log -1 --pretty='format:%at' $<))/g" $@
	git log -10 --date=format:'%a %d %b %Y %H:%M %z' --pretty=format:"<tr><td>%ad</td><td>%s</td></tr>" > $(OUT)/recent_changes.html
	sed -i -e '/WEBVAR-LATEST-UPDATES/{r $(OUT)/recent_changes.html' -e 'd}' $@

# Generate images.
$(IMG_OUT): $(OUT)/www/%: src/%
	./tools/generate_images.sh $< $(dir $@)

# Stage resources.
$(RES_OUT): $(OUT)/www/%: src/%
	mkdir -p $(dir $@)
	cp $< $@

.PHONY:
all: $(HTML_OUT) $(IMG_OUT) $(RES_OUT)
