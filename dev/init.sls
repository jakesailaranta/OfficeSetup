  {% if grain["os"] == 'Windows' %}
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
      - openjdk-17-jre-*
      - openjdk-17-jdk-*
sublime:
  file.managed:
    - name: /etc/apt/sources.list.d/sublime-text.list
    - source: salt://dev/sublime-text.list
  pkg.installed:
    - name: sublime-text
  {% endif %}
