#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

rolesdir=$(dirname $0)/..

[ ! -d $rolesdir/juju4.ipv6 ] && git clone https://github.com/juju4/ansible-ipv6 $rolesdir/juju4.ipv6
[ ! -d $rolesdir/juju4.redhat-epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat-epel
[ ! -d $rolesdir/juju4.harden-sysctl ] && git clone https://github.com/juju4/ansible-harden-sysctl $rolesdir/juju4.harden-sysctl
[ ! -d $rolesdir/kbrebanov.osquery ] && git clone https://github.com/kbrebanov/ansible-osquery.git $rolesdir/kbrebanov.osquery

