base:
  '*':
    - universal
  'os:Windows':
    - match: grains
    - choco
