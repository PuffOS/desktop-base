DEFAULT_BACKGROUND=bluedeb-1024x768.jpg

INSTALL=install -m 0644 
BACKGROUNDS=$(wildcard backgrounds/*.png backgrounds/*.jpg)
SPLASH=$(wildcard splash/*.png)
PIXMAPS=$(wildcard pixmaps/*.png)
DESKTOPFILES=$(wildcard *.desktop)

all: 

install:
	# needed if gnome-session is not installed
	mkdir -p $(DESTDIR)/usr/share/pixmaps/splash

	# the package itself
	mkdir -p $(DESTDIR)/usr/share/images/desktop-base
	$(INSTALL) $(BACKGROUNDS) $(DESTDIR)/usr/share/images/desktop-base
	cd $(DESTDIR)/usr/share/images/desktop-base && ln -s $(DEFAULT_BACKGROUND) default
	$(INSTALL) $(SPLASH) $(DESTDIR)/usr/share/images/desktop-base
	mkdir -p $(DESTDIR)/usr/share/desktop-base
	$(INSTALL) $(DESKTOPFILES) $(DESTDIR)/usr/share/desktop-base/
	mkdir -p $(DESTDIR)/usr/share/pixmaps
	$(INSTALL) $(PIXMAPS) $(DESTDIR)/usr/share/pixmaps/
