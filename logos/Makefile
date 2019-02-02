dir = usr/share/desktop-base/logos
scal_emblems_dir = $(dir)/scalable/emblems

.PHONY: build clean install

LOGOS = $(basename $(wildcard *.svg))
$(info Emblems: '$(LOGOS)')
RESOLUTIONS := 64 128 256
$(info Resolutions: '$(RESOLUTIONS)')

# The build: target should depend on all PNGs to generate
$(info $(foreach SVG,$(LOGOS),$(foreach RES,$(RESOLUTIONS),$(SVG)-$(RES).png)))
build: $(foreach SVG,$(LOGOS),$(foreach RES,$(RESOLUTIONS),$(SVG)-$(RES).png))

# Dynamically add rules for PNG generation for each resolution, for each emblem file
define SVG_TO_PNG_RULE
$1-$2.png: $1.svg
	inkscape --export-png=$$@ --export-height $2 $$<
endef
$(foreach LOGO,$(LOGOS),$(foreach RES,$(RESOLUTIONS),$(eval $(call SVG_TO_PNG_RULE,$(LOGO),$(RES)))))

clean:
	rm -f *.png

install:
	install -d $(DESTDIR)/$(dir)
	$(INSTALL_DATA) $(wildcard *.png) $(DESTDIR)/$(dir)

include ../Makefile.inc
