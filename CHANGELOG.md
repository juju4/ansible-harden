# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- sshd certificates configuration

## [1.1.0] - 2020-02-01

### Added
- RHEL/Centos8 support, packer config
- proxy support for kitchen-test through environment variables
- custom /etc/issue
- optional harden_backup vars (default: false) to have backup of files modified by copy/template modules

### Changed
- update inspec to 4.18
- update ansible to 2.9.1/2.8.3
- update ansible to 2.8.3/2.7.12
- update lkrg to 0.7
- fix ansible syntax for rsyslog tasks and templates
- aide-hids exclusion: +prometheus

## [1.0.0] - 2019-07-20

### Added
- proxy system configuration (apt, dnf, /etc/environment)
- optional openwall lkrg
https://www.openwall.com/lkrg/

### Changed
- Github: rename tags to match semantic versioning: 0.7.0, 0.8.0
- Travis: switch dist to Xenial + lxd3
- Centos7: default to python36 from EPEL
- more linting

## [0.9.0] - 2019-02-17

### Added
- test/full: add falco, ntpclient, osquery, harden-mailserver, auditd roles
- test: add openscap check on centos/redhat and ubuntu
- test/full inspec: use multiple baselines controls
- custom shell PS1 variable
- /etc/securetty: remove some lines (openscap)
- ssh/moduli: cleaning
- packer: Azure, Virtualbox, Vmware configurations
- Initial RedHat-8 (beta) support

### Changed
- Heavy lint following galaxy new rules following adoption of ansible-lint
https://groups.google.com/forum/#!topic/ansible-project/ehrb6AEptzA
https://docs.ansible.com/ansible-lint/rules/default_rules.html
https://github.com/ansible/ansible-lint
- Galaxy dependency naming evolution (juju4.redhat_epel, harden_sysctl...)
- Travis: update ansible to 2.7.5/2.6.11
- password dictionary danielmiessler/SecLists: enforce specific tag
- Firewall iptables: review Alpine Linux support
- Firewall iptables: owner filtering rules, restrict ssh from root [TODO]
- Centos/RHEL7: fix multiple issues (ansible syntax, openscap...)
- Centos/RHEL7: use pwquality package instead of cracklib (CIS/openscap)
- ssh/sshd: use templates for configuration
- default umask: from 022 to 077

### Removed
- package open-iscsi
- package setroubleshoot (CIS1.6.1.4)

## [v0.8] - 2018-06-17

### Added
- Monit for sshd, rsyslog and osqueryd
- More loop devices (ubuntu livepatch)
- Rhel: enable selinux
- Audit mode for apparmor
- Experimental: rhel7.2 kpatch support
- External dictionary for pam_cracklib (danielmiessler/SecLists)
- Shell, sudo timeout
- Motd
- UTC Timezone
- Optional testing: inspec (custom dev-sec linux-baseline), lynis, privilege escalation (kernelpop)
- Optional testing: speculative execution vulnerabilities
- Gitignore
- iptables rules.v6
- disable LLMNR

### Changed
- Osquery
- Auditd
- iptables rules.v4
- sshd config

## [v0.7] - 2017-01-30

### Added
- Initial commit on Github, include simple travis, kitchen and vagrant tests
- Jenkinsfile
