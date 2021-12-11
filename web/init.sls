apache:
  pkg.installed:
    - name: apache2
/var/www/html/index.html:
  file.managed:
    - source: salt://web/index.html
apache2:
  service:
    - running
openssh-server:
  pkg.installed
/etc/sshd/sshd_config
  file.managed:
    - source: salt://web/sshd_config
sshd:
  service:
    - running
    - watch:
      - file: /etc/sshd/sshd_config
