{% set p  = salt['pillar.get']('java', {}) %}
{% set g  = salt['grains.get']('java', {}) %}

{%- set java_home            = salt['grains.get']('java_home', salt['pillar.get']('java_home', '/usr/lib/java')) %}

{%- set default_version_name = 'jdk1.8.0_45' %}
{%- set default_file_name    = 'jdk-8u45-linux-x64.rpm' %}
{%- set default_prefix       = '/usr/java' %}
{%- set default_source_url   = 'http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm' %}
{%- set default_dl_opts      = '-b oraclelicense=accept-securebackup-cookie -L' %}

{%- set version_name   = g.get('version_name', p.get('version_name', default_version_name)) %}
{%- set file_name      = g.get('file_name', p.get('file_name', default_file_name)) %}
{%- set source_url     = g.get('source_url', p.get('source_url', default_source_url)) %}
{%- set dl_opts        = g.get('dl_opts', p.get('dl_opts', default_dl_opts)) %}
{%- set prefix         = g.get('prefix', p.get('prefix', default_prefix)) %}
{%- set java_real_home = prefix + '/' + version_name %}
{%- set jre_lib_sec    = java_real_home + '/jre/lib/security' %}

{%- set java = {} %}
{%- do java.update( { 'version_name'   : version_name,
                      'file_name'      : file_name,
                      'source_url'     : source_url,
                      'dl_opts'        : dl_opts,
                      'java_home'      : java_home,
                      'prefix'         : prefix,
                      'java_real_home' : java_real_home,
                      'jre_lib_sec'    : jre_lib_sec
                  }) %}
