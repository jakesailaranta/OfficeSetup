wallpaperfile:
  file.managed:
    - name: C:\salt\wallpaper.png
    - source: salt://windowsuniversal/wallpaper.png
    - makedirs: true
setwallpaper:
  lgpo.set:
    - user_policy:
        Desktop Wallpaper:
          Wallpaper Name: C:\salt\wallpaper.png
          Wallpaper Style: Stretch
  cmd.run:
    - name: gpupdate.exe /force
    - onchanges:
      - lgpo: setwallpaper

