GRUB_THEMES=lines-theme/grub softwaves-theme/grub
DEFAULT_BACKGROUND=desktop-background

BACKGROUNDS=$(wildcard backgrounds/*.png backgrounds/*.jpg backgrounds/*.svg backgrounds/*.tga backgrounds/*.xml)
PIXMAPS=$(wildcard pixmaps/*.png)
DESKTOPFILES=$(wildcard *.desktop)

all: build-grub

build-grub clean-grub install-grub:
	@target=`echo $@ | sed s/-grub//`; \
	for grub_theme in $(GRUB_THEMES) ; do \
		if [ -f $$grub_theme/Makefile ] ; then \
			$(MAKE) $$target -C $$grub_theme || exit 1; \
		fi \
	done$

clean: clean-grub

install: install-grub install-local

install-local:
	# background files
	mkdir -p $(DESTDIR)/usr/share/images/desktop-base
	$(INSTALL) $(BACKGROUNDS) $(DESTDIR)/usr/share/images/desktop-base
	cd $(DESTDIR)/usr/share/images/desktop-base && ln -s $(DEFAULT_BACKGROUND) default
	# emblems
	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/36x36/emblems
	$(INSTALL) $(wildcard icons/36x36/emblems/*) $(DESTDIR)/usr/share/icons/hicolor/36x36/emblems
	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/64x64/emblems
	$(INSTALL) $(wildcard icons/64x64/emblems/*) $(DESTDIR)/usr/share/icons/hicolor/64x64/emblems
	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/128x128/emblems
	$(INSTALL) $(wildcard icons/128x128/emblems/*) $(DESTDIR)/usr/share/icons/hicolor/128x128/emblems
	mkdir -p $(DESTDIR)/usr/share/icons/hicolor/scalable/emblems
	$(INSTALL) $(wildcard icons/scalable/emblems/*) $(DESTDIR)/usr/share/icons/hicolor/scalable/emblems
	# desktop files
	mkdir -p $(DESTDIR)/usr/share/desktop-base
	$(INSTALL) $(DESKTOPFILES) $(DESTDIR)/usr/share/desktop-base/
	# pixmaps files
	mkdir -p $(DESTDIR)/usr/share/pixmaps
	$(INSTALL) $(PIXMAPS) $(DESTDIR)/usr/share/pixmaps/

	# KDE Wallpaper
	## Joy
	mkdir -p $(DESTDIR)/usr/share/wallpapers/joy
	$(INSTALL) kde-wallpaper/joy/metadata.desktop $(DESTDIR)/usr/share/wallpapers/joy/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/joy/contents
	$(INSTALL) kde-wallpaper/joy/contents/screenshot.png $(DESTDIR)/usr/share/wallpapers/joy/contents/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/joy/contents/images
	$(INSTALL) $(wildcard kde-wallpaper/joy/contents/images/*) $(DESTDIR)/usr/share/wallpapers/joy/contents/images/
	# Inksplat Version
	mkdir -p $(DESTDIR)/usr/share/wallpapers/joy_inksplat
	$(INSTALL) kde-wallpaper/joy_inksplat/metadata.desktop $(DESTDIR)/usr/share/wallpapers/joy_inksplat/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/joy_inksplat/contents
	$(INSTALL) kde-wallpaper/joy_inksplat/contents/screenshot.png $(DESTDIR)/usr/share/wallpapers/joy_inksplat/contents/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/joy_inksplat/contents/images
	$(INSTALL) $(wildcard kde-wallpaper/joy_inksplat/contents/images/*) $(DESTDIR)/usr/share/wallpapers/joy_inksplat/contents/images/


	# SDDM meta theme (configured with alternatives)
	install -d $(DESTDIR)/usr/share/sddm/themes/debian-theme
	$(INSTALL) $(wildcard sddm-debian/*) $(DESTDIR)/usr/share/sddm/themes/debian-theme

	# Set Plasma 5/KDE default wallpaper
	install -d $(DESTDIR)/usr/share/plasma/shells/org.kde.plasma.desktop/contents/updates
	$(INSTALL) defaults/plasma5/desktop-base.js $(DESTDIR)/usr/share/plasma/shells/org.kde.plasma.desktop/contents/updates/

	## Joy
	install -d $(DESTDIR)/usr/share/desktop-base/joy-theme
	# login background
	$(INSTALL) joy-theme/login-background.svg $(DESTDIR)/usr/share/desktop-base/joy-theme/
	$(INSTALL) joy-theme/sddm-preview.jpg $(DESTDIR)/usr/share/desktop-base/joy-theme/


	# Xfce 4.6
	mkdir -p $(DESTDIR)/usr/share/desktop-base/profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml
	$(INSTALL) $(wildcard profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml/*) $(DESTDIR)/usr/share/desktop-base/profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml
	# GNOME background descriptor
	mkdir -p $(DESTDIR)/usr/share/gnome-background-properties
	$(INSTALL) gnome-backgrounds.xml $(DESTDIR)/usr/share/gnome-background-properties/debian.xml

	# grub
	$(INSTALL) grub/joy-grub.png $(DESTDIR)/usr/share/images/desktop-base/
	$(INSTALL) grub/spacefun-grub.png $(DESTDIR)/usr/share/images/desktop-base/
	$(INSTALL) grub/spacefun-grub-widescreen.png $(DESTDIR)/usr/share/images/desktop-base/
	$(INSTALL) grub/grub_background.sh $(DESTDIR)/usr/share/desktop-base/

	# plymouth
	install -d $(DESTDIR)/usr/share/plymouth/themes/spacefun
	$(INSTALL) $(wildcard plymouth/spacefun/*) $(DESTDIR)/usr/share/plymouth/themes/spacefun

	install -d $(DESTDIR)/usr/share/plymouth/themes/joy
	$(INSTALL) $(wildcard plymouth/joy/*) $(DESTDIR)/usr/share/plymouth/themes/joy

	install -d $(DESTDIR)/usr/share/plymouth/themes/lines
	$(INSTALL) $(wildcard plymouth/lines/*) $(DESTDIR)/usr/share/plymouth/themes/lines

	# Lines theme (Jessie’s default)
	### Login background
	install -d $(DESTDIR)/usr/share/desktop-base/lines-theme/login
	$(INSTALL) $(wildcard lines-theme/login/*) $(DESTDIR)/usr/share/desktop-base/lines-theme/login
	### Wallpapers
	install -d $(DESTDIR)/usr/share/desktop-base/lines-theme/wallpaper/contents/images
	$(INSTALL) lines-theme/wallpaper/metadata.desktop $(DESTDIR)/usr/share/desktop-base/lines-theme/wallpaper
	$(INSTALL) lines-theme/wallpaper/gnome-background.xml $(DESTDIR)/usr/share/desktop-base/lines-theme/wallpaper
	$(INSTALL) $(wildcard lines-theme/wallpaper/contents/images/*) $(DESTDIR)/usr/share/desktop-base/lines-theme/wallpaper/contents/images/
	$(INSTALL) lines-theme/gnome-wp-list.xml $(DESTDIR)/usr/share/gnome-background-properties/debian-lines.xml
	# Wallpaper symlink for KDE
	install -d $(DESTDIR)/usr/share/wallpapers
	cd $(DESTDIR)/usr/share/wallpapers && ln -s /usr/share/desktop-base/lines-theme/wallpaper Lines

	### Lockscreen
	install -d $(DESTDIR)/usr/share/desktop-base/lines-theme/lockscreen/contents/images
	$(INSTALL) lines-theme/lockscreen/metadata.desktop $(DESTDIR)/usr/share/desktop-base/lines-theme/lockscreen
	$(INSTALL) lines-theme/lockscreen/gnome-background.xml $(DESTDIR)/usr/share/desktop-base/lines-theme/lockscreen
	$(INSTALL) $(wildcard lines-theme/lockscreen/contents/images/*) $(DESTDIR)/usr/share/desktop-base/lines-theme/lockscreen/contents/images/
	# Lock screen symlink for KDE
	install -d $(DESTDIR)/usr/share/wallpapers
	cd $(DESTDIR)/usr/share/wallpapers && ln -s /usr/share/desktop-base/lines-theme/lockscreen LinesLockScreen


	# Soft waves theme (Stretch’s default)
	### Login background
	install -d $(DESTDIR)/usr/share/desktop-base/softwaves-theme/login
	$(INSTALL) $(wildcard softwaves-theme/login/*) $(DESTDIR)/usr/share/desktop-base/softwaves-theme/login
	### Wallpapers
	install -d $(DESTDIR)/usr/share/desktop-base/softwaves-theme/wallpaper/contents/images
	$(INSTALL) softwaves-theme/wallpaper/metadata.desktop $(DESTDIR)/usr/share/desktop-base/softwaves-theme/wallpaper
	$(INSTALL) softwaves-theme/wallpaper/gnome-background.xml $(DESTDIR)/usr/share/desktop-base/softwaves-theme/wallpaper
	$(INSTALL) $(wildcard softwaves-theme/wallpaper/contents/images/*) $(DESTDIR)/usr/share/desktop-base/softwaves-theme/wallpaper/contents/images/
	$(INSTALL) softwaves-theme/gnome-wp-list.xml $(DESTDIR)/usr/share/gnome-background-properties/debian-softwaves.xml
	# Wallpaper symlink for KDE
	install -d $(DESTDIR)/usr/share/wallpapers
	cd $(DESTDIR)/usr/share/wallpapers && ln -s /usr/share/desktop-base/softwaves-theme/wallpaper SoftWaves

	### Lockscreen
	install -d $(DESTDIR)/usr/share/desktop-base/softwaves-theme/lockscreen/contents/images
	$(INSTALL) softwaves-theme/lockscreen/metadata.desktop $(DESTDIR)/usr/share/desktop-base/softwaves-theme/lockscreen
	$(INSTALL) softwaves-theme/lockscreen/gnome-background.xml $(DESTDIR)/usr/share/desktop-base/softwaves-theme/lockscreen
	$(INSTALL) $(wildcard softwaves-theme/lockscreen/contents/images/*) $(DESTDIR)/usr/share/desktop-base/softwaves-theme/lockscreen/contents/images/
	# Lock screen symlink for KDE
	install -d $(DESTDIR)/usr/share/wallpapers
	cd $(DESTDIR)/usr/share/wallpapers && ln -s /usr/share/desktop-base/softwaves-theme/lockscreen SoftWavesLockScreen

include Makefile.inc
