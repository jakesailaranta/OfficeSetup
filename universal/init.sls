{% if "Windows" == grains["os"] %}
{%     set firefox = "firefox-esr_x64" %}
{% else %}
{%     set firefox = "firefox-esr" %}
{% endif %}
{{ firefox }}:
  pkg:
    - installed
libreoffice:
  pkg:
   - installed
{% if "Windows" == grains["os"] %}
{%      set librereporttemplate = "\"C:/Program Files/LibreOffice/share/template/common/officorr/basic-reporting-layout.ott\"" %}
{% else %}
{%     set librereporttemplate = "/usr/lib/libreoffice/share/template/common/officorr/basic-reporting-layout.ott" %}
{% endif %}
{{ librereporttemplate }}:
  file.managed:
    - source: salt://universal/basic-reporting-layout.ott
    - require:
      - pkg: libreoffice

