base:
  'os:Windows':
    - match: grain
    - choco
    - windowsuniversal
  'kernel:Linux':
    - match: grain
    - linuxuniversal
  'os:Ubuntu':
    - match: grain
    - ubuntuwallpaper
  '*':
    - universal
  'media-*':
    - media
  'web-*':
    - web
