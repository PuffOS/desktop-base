DEFAULT_BACKGROUND=desktop-background

INSTALL=install -m 0644
BACKGROUNDS=$(wildcard backgrounds/*.png backgrounds/*.jpg backgrounds/*.svg backgrounds/*.tga backgrounds/*.xml)
PIXMAPS=$(wildcard pixmaps/*.png)
DESKTOPFILES=$(wildcard *.desktop)

all:

clean:

install:
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

	# KDE Config
	mkdir -p $(DESTDIR)/usr/share/desktop-base/profiles/kde-profile/share/config
	$(INSTALL) $(wildcard profiles/kde-profile/share/config/*) $(DESTDIR)/usr/share/desktop-base/profiles/kde-profile/share/config
	mkdir -p $(DESTDIR)/usr/share/kde4/config
	$(INSTALL) profiles/kde-profile/kdeglobals $(DESTDIR)/usr/share/kde4/config
	mkdir -p $(DESTDIR)/usr/share/kde4/apps/plasma-desktop/init/
	$(INSTALL) kde-wallpaper/10-desktop-base.js $(DESTDIR)/usr/share/kde4/apps/plasma-desktop/init/

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
	## Lines
	mkdir -p $(DESTDIR)/usr/share/wallpapers/Lines
	$(INSTALL) kde-wallpaper/Lines/metadata.desktop $(DESTDIR)/usr/share/wallpapers/Lines/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/Lines/contents
	$(INSTALL) kde-wallpaper/Lines/contents/screenshot.png $(DESTDIR)/usr/share/wallpapers/Lines/contents/
	mkdir -p $(DESTDIR)/usr/share/wallpapers/Lines/contents/images
	$(INSTALL) $(wildcard kde-wallpaper/Lines/contents/images/*) $(DESTDIR)/usr/share/wallpapers/Lines/contents/images/


	## SDDM meta theme (configured with alternatives)
	install -d $(DESTDIR)/usr/share/sddm/themes/debian-theme
	$(INSTALL) $(wildcard sddm-debian/*) $(DESTDIR)/usr/share/sddm/themes/debian-theme


	## Lines
	install -d $(DESTDIR)/usr/share/desktop-base/lines-theme
	# login background
	$(INSTALL) lines-theme/login-background.svg $(DESTDIR)/usr/share/desktop-base/lines-theme/
	$(INSTALL) lines-theme/login-background-with-logo.svg $(DESTDIR)/usr/share/desktop-base/lines-theme/
	$(INSTALL) lines-theme/sddm-preview.jpg $(DESTDIR)/usr/share/desktop-base/lines-theme/

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
	$(INSTALL) grub/lines-grub.png $(DESTDIR)/usr/share/images/desktop-base/
	$(INSTALL) grub/lines-grub-1920x1080.png $(DESTDIR)/usr/share/images/desktop-base/
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


	# Soft waves theme (Stretch default)
	### Login background
	install -d $(DESTDIR)/usr/share/desktop-base/softwaves-theme
	$(INSTALL) softwaves-theme/sddm-preview.jpg $(DESTDIR)/usr/share/desktop-base/softwaves-theme/
	install -d $(DESTDIR)/usr/share/desktop-base/softwaves-theme/backgrounds
	$(INSTALL) softwaves-theme/backgrounds/login.svg $(DESTDIR)/usr/share/desktop-base/softwaves-theme/backgrounds
	### Wallpapers
	install -d $(DESTDIR)/usr/share/desktop-base/softwaves-theme/wallpaper/contents/images
	$(INSTALL) softwaves-theme/wallpaper/metadata.desktop $(DESTDIR)/usr/share/desktop-base/softwaves-theme/wallpaper
	$(INSTALL) softwaves-theme/wallpaper/gnome-background.xml $(DESTDIR)/usr/share/desktop-base/softwaves-theme/wallpaper
	$(INSTALL) $(wildcard softwaves-theme/wallpaper/contents/images/*) $(DESTDIR)/usr/share/desktop-base/softwaves-theme/wallpaper/contents/images/
	$(INSTALL) softwaves-theme/gnome-wp-list-softwaves.xml $(DESTDIR)/usr/share/gnome-background-properties/debian-softwaves.xml
	# Wallpaper symlink for KDE
	install -d $(DESTDIR)/usr/share/wallpapers
	cd $(DESTDIR)/usr/share/wallpapers && ln -s /usr/share/desktop-base/softwaves-theme/wallpaper SoftWaves

	### Lockscreen
	install -d $(DESTDIR)/usr/share/desktop-base/softwaves-theme/lockscreen/contents/images
	$(INSTALL) softwaves-theme/lockscreen/metadata.desktop $(DESTDIR)/usr/share/desktop-base/softwaves-theme/lockscreen
	$(INSTALL) softwaves-theme/lockscreen/gnome-background.xml $(DESTDIR)/usr/share/desktop-base/softwaves-theme/lockscreen
	$(INSTALL) $(wildcard softwaves-theme/lockscreen/contents/images/*) $(DESTDIR)/usr/share/desktop-base/softwaves-theme/lockscreen/contents/images/
	$(INSTALL) softwaves-theme/gnome-wp-list-softwaves.xml $(DESTDIR)/usr/share/gnome-background-properties/debian-softwaves.xml
	# Lock screen symlink for KDE
	install -d $(DESTDIR)/usr/share/wallpapers
	cd $(DESTDIR)/usr/share/wallpapers && ln -s /usr/share/desktop-base/softwaves-theme/lockscreen SoftWavesLockScreen
