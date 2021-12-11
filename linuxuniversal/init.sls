linuxpackages:
  pkg.installed:
    - pkgs:
      - tree
      - nano
      - bash-completion
      - ufw
/etc/ufw/user.rules:
  file.managed:
    - source: salt://linuxuniversal/user.rules
/etc/ufw/user6.rules:
  file.managed:
    - source: salt://linuxuniversal/user6.rules
/etc/ufw/ufw.conf:
  file.managed:
    - source: salt://linuxuniversal/ufw.conf
ufw:
  service:
    - running
  - watch:
    - file: /etc/ufw/user.rules
    - file: /etc/ufw/user6.rules
    - file: /etc/ufw/ufw.conf
   
  
