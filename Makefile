DEFAULT_BACKGROUND=debblue-1600x1200.png
DEFAULT_SPLASH=debblue.png
DEFAULT_GRUB_SPLASH=debblue.xpm.gz

INSTALL=install -m 0644 
BACKGROUNDS=$(wildcard backgrounds/*.png backgrounds/*.jpg)
EMBLEMS=$(wildcard emblems/*png emblems/*icon)
SPLASH=$(wildcard splash/*.png)
GRUB_SPLASH=$(wildcard grub/*gz)
PIXMAPS=$(wildcard pixmaps/*.png)
DESKTOPFILES=$(wildcard *.desktop)
GDMTHEMES=$(wildcard gdm/*)

all:

install:
	mkdir -p $(DESTDIR)/usr/share/pixmaps/splash
	mkdir -p $(DESTDIR)/usr/share/images/desktop-base

	$(INSTALL) $(BACKGROUNDS) $(DESTDIR)/usr/share/images/desktop-base
	cd $(DESTDIR)/usr/share/images/desktop-base && ln -s $(DEFAULT_BACKGROUND) default

	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/48x48/emblems
	$(INSTALL) $(EMBLEMS) $(DESTDIR)/usr/share/icons/hicolor/48x48/emblems/

	$(INSTALL) $(SPLASH) $(DESTDIR)/usr/share/images/desktop-base
	cd $(DESTDIR)/usr/share/images/desktop-base && ln -s $(DEFAULT_SPLASH) default_splash

	mkdir -p $(DESTDIR)/boot/grub/themes
	$(INSTALL) $(GRUB_SPLASH) $(DESTDIR)/boot/grub/themes
	cd $(DESTDIR)/boot/grub/themes && ln -s $(DEFAULT_GRUB_SPLASH) default

	mkdir -p $(DESTDIR)/usr/share/desktop-base
	$(INSTALL) $(DESKTOPFILES) $(DESTDIR)/usr/share/desktop-base/

	mkdir -p $(DESTDIR)/usr/share/pixmaps
	$(INSTALL) $(PIXMAPS) $(DESTDIR)/usr/share/pixmaps/

	mkdir -p $(DESTDIR)/usr/share/gdm/themes
	cp -r $(GDMTHEMES) $(DESTDIR)/usr/share/gdm/themes
