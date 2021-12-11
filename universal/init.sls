{% if "Windows" == grains["os"] %}
{%     set firefox = "firefox-esr_x64" %}
{%     set librereporttemplate = "\"C:/Program Files/LibreOffice/share/template/common\"" %}
{%     set pdfreader = "adobereader" %}
{%     set 7zip = "7zip" %}
{% else if "Ubuntu == grains["os"] %}
{%     set firefox = "firefox" %}
{%     set librereporttemplate = "/usr/lib/libreoffice/share/template/common/" %}
{%     set pdfreader = "evince" %}
{%     set 7zip = "p7zip %}
{% else %}
{%     set firefox = "firefox-esr" %}
{%     set librereporttemplate = "/usr/lib/libreoffice/share/template/common/" %}
{%     set pdfreader = "evince" %}
{%     set 7zip = "p7zip" %}
{% endif %}
{{ firefox }}:
  pkg:
    - installed
libreoffice:
  pkg:
    - installed
{7zip}:
  pkg:
    - installed
{{ librereporttemplate }}:
  file.recurse:
    - source: salt://universal/common/
    - require:
      - pkg: libreoffice
