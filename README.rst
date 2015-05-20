========
sun-java-rpm
========

Formula to install Java JDKs from an RPM sourced via URL.

This is a quick-and-dirty copy of the salt sun-java-formula but 
instead of downloading and installing a tarball, we just download
and install an RPM

Ideally, this should be retrofitted into the original sun-java formula at some point maybe?

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.
    
Available states
================

.. contents::
    :local:

``sun-java-rpm``
------------

Downloads the tarball from the java:source_url configured as either a pillar or grain and will not do anything
if source_url is omitted. Then unpacks the archive into java:prefix (defaults to /usr/share/java).
Will use the alternatives system to link the installation to java_home. Please see the pillar.example for configuration.

Tested on CentOS 6.X 
