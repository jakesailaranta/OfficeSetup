base:
  'os:Windows':
    - match: grain
    - choco
  '*':
    - universal
  'media-*':
    - media
