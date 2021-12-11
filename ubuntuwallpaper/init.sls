wallpaperfile:
  file.managed:
    - name: /usr/share/backgrounds/wallpaper.png
    - source: salt://ubuntuwallpaper/wallpaper.png
ubuntuwallpaper:
  cmd.run:
    - name: gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/wallpaper.png
