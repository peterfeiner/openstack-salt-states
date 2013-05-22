{% set canary = pillar.get('openstack', {}).get('canary', {}) %}
{% set version = pillar.get('openstack', {}).get('version', 'grizzly') %}
{% set source = canary.get('source', 'deb http://downloads.gridcentriclabs.com/packages/canary/%s/ubuntu gridcentric multiverse' % version) %}

{% macro package(name) %}
{{name}}:
    pkg:
        - latest
    pkgrepo.managed:
        - name: {{source}}
        - baseurl: {{source}}
        - humanname: canary
        - file: /etc/apt/sources.list.d/canary.list
    require:
        - pkgrepo: {{source}}
{% endmacro %}
