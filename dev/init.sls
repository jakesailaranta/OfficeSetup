  {% if grains["os"] == 'Windows' %}
javajdk:
  chocolatey.installed:
    - name: oracle17jdk
eclipse:
  chocolatey.installed:
    - name: eclipse
  {% else %}
java:
  package.installed:
    - pkgs:
      - ca-certificates-java
      - java-common 
      - libecj-java
      - openjdk-17-jdk
      - openjdk-17-jre
sublime:
  file.managed:
    - name: /usr/share/debs/sublime-text_build-4121_amd64.deb
    - makedirs: true
    - source: salt://dev/sublime-text_build-4121_amd64.deb
  pkg.installed:
    - name: sublime-text
    - sources:
      - sublime-text: /usr/share/debs/sublime-text_build-4121_amd64.deb
    - require:
      - file: sublime
  {% endif %}
