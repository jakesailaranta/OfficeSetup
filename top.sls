base:
  'os:Windows':
    - match: grain
    - choco
    - windowsuniversal
  'os:Ubuntu':
    - match: grain
    - ubuntuwallpaper
  '*':
    - universal
  'media-*':
    - media
