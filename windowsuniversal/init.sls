wallpaper:
  file.managed:
    - name: C\salt\wallpaper.png
    - source: salt://windowsuniversal/wallpaper.png
    - makedirs: true
  lgpo.set:
    - user_policy:
      Desktop Wallpaper:
        Wallpaper Name: C:\salt\wallpaper.png
        WallpaperStyle: Fill
  cmd.run:
    - name: gpupdate.exe /force
    - watch:
      - file: wallpaper
