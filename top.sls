base:
  'os:Windows':
    - match: grain
    - choco
    - windowsuniversal
  '*':
    - universal
  'media-*':
    - media
