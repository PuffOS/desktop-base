GRUB_THEMES=softwaves-theme/grub lines-theme/grub joy-theme/grub spacefun-theme/grub
DEFAULT_BACKGROUND=desktop-background

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


	# Set Plasma 5/KDE default wallpaper
	install -d $(DESTDIR)/usr/share/plasma/shells/org.kde.plasma.desktop/contents/updates
	$(INSTALL) defaults/plasma5/desktop-base.js $(DESTDIR)/usr/share/plasma/shells/org.kde.plasma.desktop/contents/updates/

	# Xfce 4.6
	mkdir -p $(DESTDIR)/usr/share/desktop-base/profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml
	$(INSTALL) $(wildcard profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml/*) $(DESTDIR)/usr/share/desktop-base/profiles/xdg-config/xfce4/xfconf/xfce-perchannel-xml

	# GNOME background descriptors
	mkdir -p $(DESTDIR)/usr/share/gnome-background-properties

	# plymouth
	install -d $(DESTDIR)/usr/share/plymouth/themes/spacefun
	$(INSTALL) $(wildcard plymouth/spacefun/*) $(DESTDIR)/usr/share/plymouth/themes/spacefun

	install -d $(DESTDIR)/usr/share/plymouth/themes/joy
	$(INSTALL) $(wildcard plymouth/joy/*) $(DESTDIR)/usr/share/plymouth/themes/joy

	install -d $(DESTDIR)/usr/share/plymouth/themes/lines
	$(INSTALL) $(wildcard plymouth/lines/*) $(DESTDIR)/usr/share/plymouth/themes/lines


	# Space Fun theme (Squeeze’s default)
	### Login background
	install -d $(DESTDIR)/usr/share/desktop-base/spacefun-theme/login
	$(INSTALL) $(wildcard spacefun-theme/login/*) $(DESTDIR)/usr/share/desktop-base/spacefun-theme/login
	### Wallpapers
	install -d $(DESTDIR)/usr/share/desktop-base/spacefun-theme/wallpaper/contents/images
	$(INSTALL) spacefun-theme/wallpaper/metadata.desktop $(DESTDIR)/usr/share/desktop-base/spacefun-theme/wallpaper
	$(INSTALL) spacefun-theme/wallpaper/gnome-background.xml $(DESTDIR)/usr/share/desktop-base/spacefun-theme/wallpaper
	$(INSTALL) $(wildcard spacefun-theme/wallpaper/contents/images/*) $(DESTDIR)/usr/share/desktop-base/spacefun-theme/wallpaper/contents/images/
	$(INSTALL) spacefun-theme/gnome-wp-list.xml $(DESTDIR)/usr/share/gnome-background-properties/debian-spacefun.xml
	# Wallpaper symlink for KDE
	install -d $(DESTDIR)/usr/share/wallpapers
	cd $(DESTDIR)/usr/share/wallpapers && ln -s /usr/share/desktop-base/spacefun-theme/wallpaper SpaceFun

	### Lockscreen (same as wallpaper)
	cd $(DESTDIR)/usr/share/desktop-base/spacefun-theme && ln -s wallpaper lockscreen


	# Joy theme (Wheezy’s default)
	### Login background
	install -d $(DESTDIR)/usr/share/desktop-base/joy-theme/login
	$(INSTALL) $(wildcard joy-theme/login/*) $(DESTDIR)/usr/share/desktop-base/joy-theme/login
	### Wallpapers
	install -d $(DESTDIR)/usr/share/desktop-base/joy-theme/wallpaper/contents/images
	$(INSTALL) joy-theme/wallpaper/metadata.desktop $(DESTDIR)/usr/share/desktop-base/joy-theme/wallpaper
	$(INSTALL) joy-theme/wallpaper/gnome-background.xml $(DESTDIR)/usr/share/desktop-base/joy-theme/wallpaper
	$(INSTALL) $(wildcard joy-theme/wallpaper/contents/images/*) $(DESTDIR)/usr/share/desktop-base/joy-theme/wallpaper/contents/images/
	$(INSTALL) joy-theme/gnome-wp-list.xml $(DESTDIR)/usr/share/gnome-background-properties/debian-joy.xml
	# Wallpaper symlink for KDE
	install -d $(DESTDIR)/usr/share/wallpapers
	cd $(DESTDIR)/usr/share/wallpapers && ln -s /usr/share/desktop-base/joy-theme/wallpaper Joy

	### Lockscreen
	install -d $(DESTDIR)/usr/share/desktop-base/joy-theme/lockscreen/contents/images
	$(INSTALL) joy-theme/lockscreen/metadata.desktop $(DESTDIR)/usr/share/desktop-base/joy-theme/lockscreen
	$(INSTALL) joy-theme/lockscreen/gnome-background.xml $(DESTDIR)/usr/share/desktop-base/joy-theme/lockscreen
	$(INSTALL) $(wildcard joy-theme/lockscreen/contents/images/*) $(DESTDIR)/usr/share/desktop-base/joy-theme/lockscreen/contents/images/
	# Lock screen symlink for KDE
	install -d $(DESTDIR)/usr/share/wallpapers
	cd $(DESTDIR)/usr/share/wallpapers && ln -s /usr/share/desktop-base/joy-theme/lockscreen JoyLockScreen


	# Joy Inksplat theme (Wheezy’s alternate theme)
	### Wallpapers
	install -d $(DESTDIR)/usr/share/desktop-base/joy-inksplat-theme/wallpaper/contents/images
	$(INSTALL) joy-inksplat-theme/wallpaper/metadata.desktop $(DESTDIR)/usr/share/desktop-base/joy-inksplat-theme/wallpaper
	$(INSTALL) joy-inksplat-theme/wallpaper/gnome-background.xml $(DESTDIR)/usr/share/desktop-base/joy-inksplat-theme/wallpaper
	$(INSTALL) $(wildcard joy-inksplat-theme/wallpaper/contents/images/*) $(DESTDIR)/usr/share/desktop-base/joy-inksplat-theme/wallpaper/contents/images/
	$(INSTALL) joy-inksplat-theme/gnome-wp-list.xml $(DESTDIR)/usr/share/gnome-background-properties/debian-joy-inksplat.xml
	# Wallpaper symlink for KDE
	install -d $(DESTDIR)/usr/share/wallpapers
	cd $(DESTDIR)/usr/share/wallpapers && ln -s /usr/share/desktop-base/joy-inksplat-theme/wallpaper JoyInksplat

	### Lockscreen (same as Joy)
	cd $(DESTDIR)/usr/share/desktop-base/joy-inksplat-theme && ln -s /usr/share/desktop-base/joy-theme/lockscreen lockscreen


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
