#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/juju4.ipv6 ] && git clone https://github.com/juju4/ansible-ipv6 $rolesdir/juju4.ipv6
[ ! -d $rolesdir/juju4.redhat_epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat_epel
[ ! -d $rolesdir/juju4.harden_sysctl ] && git clone https://github.com/juju4/ansible-harden-sysctl $rolesdir/juju4.harden_sysctl
[ ! -d $rolesdir/juju4.harden_mailserver ] && git clone https://github.com/juju4/ansible-harden-mailserver $rolesdir/juju4.harden_mailserver
#[ ! -d $rolesdir/kbrebanov.osquery ] && git clone https://github.com/kbrebanov/ansible-osquery.git $rolesdir/kbrebanov.osquery
[ ! -d $rolesdir/juju4.osquery ] && git clone https://github.com/juju4/ansible-osquery.git $rolesdir/juju4.osquery
[ ! -d $rolesdir/juju4.auditd ] && git clone https://github.com/juju4/ansible-auditd $rolesdir/juju4.auditd
[ ! -d $rolesdir/juju4.syslogclient ] && git clone https://github.com/juju4/ansible-syslogclient $rolesdir/juju4.syslogclient
[ ! -d $rolesdir/juju4.ntpclient ] && git clone https://github.com/juju4/ansible-ntpclient $rolesdir/juju4.ntpclient
[ ! -d $rolesdir/juju4.falco ] && git clone https://github.com/juju4/ansible-falco $rolesdir/juju4.falco
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.harden ] && ln -s ansible-harden $rolesdir/juju4.harden
[ ! -e $rolesdir/juju4.harden ] && cp -R $rolesdir/ansible-harden $rolesdir/juju4.harden

## don't stop build on this script return code
true
