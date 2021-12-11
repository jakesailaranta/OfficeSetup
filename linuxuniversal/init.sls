linuxpackages:
  pkg.installed:
    - pkgs:
      - tree
      - nano
      - bash-completion
      - ufw
ufw:
  - enabled: true
  - services:
    - "4505, 4506"
      - protocol: tcp
