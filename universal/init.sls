{% if "Windows" == grains["os"] %}
{%     set firefox = "firefox-esr_x64" %}
{%     set librereporttemplate = "\"C:/Program Files/LibreOffice/share/template/common\"" %}
{%     set pdfreader = adobereader %}
{% else if "Ubuntu == grains["os"] %}
{%     set firefox = "firefox" %}
{%     set librereporttemplate = "/usr/lib/libreoffice/share/template/common/" %}
{%     set pdfreader = evince %}
{% else %}
{%     set firefox = "firefox-esr" %}
{%     set librereporttemplate = "/usr/lib/libreoffice/share/template/common/" %}
{%     set pdfreader = evince %}
{% endif %}
{{ firefox }}:
  pkg:
    - installed
libreoffice:
  pkg:
    - installed
winrar:
  pkg:
    - installed
{{ librereporttemplate }}:
  file.recurse:
    - source: salt://universal/common/
    - require:
      - pkg: libreoffice
