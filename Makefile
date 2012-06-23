DEFAULT_BACKGROUND=desktop-background

INSTALL=install -m 0644
BACKGROUNDS=$(wildcard backgrounds/*.png backgrounds/*.jpg backgrounds/*.svg backgrounds/*.tga)
EMBLEMS=$(wildcard emblems/*png emblems/*icon)
SPLASH=$(wildcard splash/*.png splash/*.svg)
PIXMAPS=$(wildcard pixmaps/*.png)
DESKTOPFILES=$(wildcard *.desktop)

all:

clean:

install:
	# background files
	mkdir -p $(DESTDIR)/usr/share/images/desktop-base
	$(INSTALL) $(BACKGROUNDS) $(DESTDIR)/usr/share/images/desktop-base
	cd $(DESTDIR)/usr/share/images/desktop-base && ln -s $(DEFAULT_BACKGROUND) default
	# splash files
	$(INSTALL) $(SPLASH) $(DESTDIR)/usr/share/images/desktop-base
	# emblems
	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/36x36/emblems
	$(INSTALL) $(EMBLEMS) $(DESTDIR)/usr/share/icons/hicolor/36x36/emblems/
	# desktop files
	mkdir -p $(DESTDIR)/usr/share/desktop-base
	$(INSTALL) $(DESKTOPFILES) $(DESTDIR)/usr/share/desktop-base/
	# pixmaps files
	mkdir -p $(DESTDIR)/usr/share/pixmaps
	$(INSTALL) $(PIXMAPS) $(DESTDIR)/usr/share/pixmaps/

	# KDE Config
	mkdir -p $(DESTDIR)/usr/share/kde4/config
	$(INSTALL) profiles/kde-profile/kdeglobals $(DESTDIR)/usr/share/kde4/config

	# KDM theme
	mkdir -p $(DESTDIR)/etc/default/kdm.d
	$(INSTALL) kdm-theme/kdm.d/10_desktop-base $(DESTDIR)/etc/default/kdm.d

	mkdir -p $(DESTDIR)/usr/share/kde4/apps/kdm/themes/joy
	$(INSTALL) $(wildcard kdm-theme/joy/*) $(DESTDIR)/usr/share/kde4/apps/kdm/themes/joy
	mkdir -p $(DESTDIR)/usr/share/kde4/apps/kdm/themes/spacefun
	$(INSTALL) $(wildcard kdm-theme/spacefun/*) $(DESTDIR)/usr/share/kde4/apps/kdm/themes/spacefun
	mkdir -p $(DESTDIR)/usr/share/kde4/apps/kdm/themes/debian-moreblue
	$(INSTALL) $(wildcard kdm-theme/debian-moreblue/*) $(DESTDIR)/usr/share/kde4/apps/kdm/themes/debian-moreblue
	mkdir -p $(DESTDIR)/usr/share/kde4/apps/kdm/themes/moreblue-orbit
	$(INSTALL) $(wildcard kdm-theme/moreblue-orbit/*) $(DESTDIR)/usr/share/kde4/apps/kdm/themes/moreblue-orbit
	mkdir -p $(DESTDIR)/usr/share/kde4/apps/kdm/themes/nightly
	$(INSTALL) $(wildcard kdm-theme/nightly/*) $(DESTDIR)/usr/share/kde4/apps/kdm/themes/nightly

	# KSPLASH theme
	install -d $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy
	$(INSTALL) ksplash-theme/joy/Preview.png $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy
	$(INSTALL) ksplash-theme/joy/Theme.rc $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy
	install -d $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy/1024x768
	$(INSTALL) $(wildcard ksplash-theme/joy/1024x768/*) $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy/1024x768
	install -d $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy/1280x1024
	$(INSTALL) $(wildcard ksplash-theme/joy/1280x1024/*) $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy/1280x1024
	install -d $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy/1366x768
	$(INSTALL) $(wildcard ksplash-theme/joy/1366x768/*) $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy/1366x768
	install -d $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy/1600x1200
	$(INSTALL) $(wildcard ksplash-theme/joy/1600x1200/*) $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy/1600x1200
	install -d $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy/1920x1080
	$(INSTALL) $(wildcard ksplash-theme/joy/1920x1080/*) $(DESTDIR)/usr/share/kde4/apps/ksplash/Themes/joy/1920x1080

	# KDE Config
	mkdir -p $(DESTDIR)/usr/share/desktop-base/profiles/kde-profile/share/config
	$(INSTALL) $(wildcard profiles/kde-profile/share/config/*) $(DESTDIR)/usr/share/desktop-base/profiles/kde-profile/share/config

	# Xfce 4.6
	mkdir -p $(DESTDIR)/usr/share/desktop-base/profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml
	$(INSTALL) $(wildcard profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml/*) $(DESTDIR)/usr/share/desktop-base/profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml
	# GNOME background descriptor
	mkdir -p $(DESTDIR)/usr/share/gnome-background-properties
	$(INSTALL) gnome-backgrounds.xml $(DESTDIR)/usr/share/gnome-background-properties/debian.xml
	# GDM 3 theme
	mkdir -p $(DESTDIR)/usr/share/gdm/greeter-config
	$(INSTALL) gdm3/background.svg $(DESTDIR)/usr/share/images/desktop-base/login-background.svg
	$(INSTALL) gdm3/10_desktop-base $(DESTDIR)/usr/share/gdm/greeter-config

	# grub
	$(INSTALL) grub/joy-grub.png $(DESTDIR)/usr/share/images/desktop-base/
	$(INSTALL) grub/grub_background.sh $(DESTDIR)/usr/share/desktop-base/

	# plymouth
	install -d $(DESTDIR)/usr/share/plymouth/themes/spacefun
	$(INSTALL) $(wildcard plymouth/spacefun/*) $(DESTDIR)/usr/share/plymouth/themes/spacefun

	install -d $(DESTDIR)/usr/share/plymouth/themes/joy
	$(INSTALL) $(wildcard plymouth/joy/*) $(DESTDIR)/usr/share/plymouth/themes/joy
	
