DEFAULT_BACKGROUND=desktop-background

INSTALL=install -m 0644 
BACKGROUNDS=$(wildcard backgrounds/*.png backgrounds/*.jpg)
EMBLEMS=$(wildcard emblems/*png emblems/*icon)
SPLASH=$(wildcard splash/*.png)
PIXMAPS=$(wildcard pixmaps/*.png)
DESKTOPFILES=$(wildcard *.desktop)

all:

install:
	mkdir -p $(DESTDIR)/usr/share/images/desktop-base
	$(INSTALL) $(BACKGROUNDS) $(DESTDIR)/usr/share/images/desktop-base
	cd $(DESTDIR)/usr/share/images/desktop-base && ln -s $(DEFAULT_BACKGROUND) default
	$(INSTALL) $(SPLASH) $(DESTDIR)/usr/share/images/desktop-base

	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/48x48/emblems
	$(INSTALL) $(EMBLEMS) $(DESTDIR)/usr/share/icons/hicolor/48x48/emblems/

	mkdir -p $(DESTDIR)/usr/share/desktop-base
	$(INSTALL) $(DESKTOPFILES) $(DESTDIR)/usr/share/desktop-base/

	mkdir -p $(DESTDIR)/usr/share/pixmaps
	$(INSTALL) $(PIXMAPS) $(DESTDIR)/usr/share/pixmaps/

