{% if "Windows" == grains["os"] %}
{%     set firefox = "firefox-esr_x64" %}
{%     set librereporttemplate = "\"C:/Program Files/LibreOffice/share/template/common/officorr/basic-reporting-layout.ott\"" %}
{% else %}
{%     set firefox = "firefox-esr" %}
{%     set librereporttemplate = "/usr/lib/libreoffice/share/template/common/officorr/basic-reporting-layout.ott" %}
{% endif %}
{{ firefox }}:
  pkg:
    - installed
libreoffice:
  pkg:
   - installed
{{ librereporttemplate }}:
  file.managed:
    - source: salt://universal/basic-reporting-layout.ott
    - require:
      - pkg: libreoffice

