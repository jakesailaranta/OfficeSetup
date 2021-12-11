{% if grains["os"] == 'Windows' %}
{%     set firefox = "firefox-esr_x64" %}
{%     set librereporttemplate = "\"C:/Program Files/LibreOffice/share/template/common\"" %}
{%     set pdfreader = "adobereader" %}
{% elif grains["os"] == 'Ubuntu' %}
{%     set firefox = "firefox" %}
{%     set librereporttemplate = "/usr/lib/libreoffice/share/template/common/" %}
{%     set pdfreader = "evince" %}
{% else %}
{%     set firefox = "firefox-esr" %}
{%     set librereporttemplate = "/usr/lib/libreoffice/share/template/common/" %}
{%     set pdfreader = "evince" %}
{% endif %}
{{ firefox }}:
  pkg:
    - installed
libreoffice:
  pkg:
    - installed
{{ librereporttemplate }}:
  file.recurse:
    - source: salt://universal/common/
    - require:
      - pkg: libreoffice
filearchiver:
  pkg.installed:
  {% if grains["os"] == 'Windows' %}
    - name: 7zip
  {% else %}
    - name: p7zip
  {% endif %}
filezilla:
  pkg:
    - installed
