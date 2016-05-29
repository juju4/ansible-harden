[![Build Status](https://travis-ci.org/juju4/ansible-harden.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden)
# harden ansible role

A simple ansible role to harden system (linux, windows...). Few task example below.

Unix
* SSH key only
* (debian) Immutable system directory
/lib /etc/init.d /boot are tagged immutable
/etc/apt/apt.conf.d/99security allows to handle gracefully update inside apt but else you will need to handle manually.
* block usb and firewire drivers

Mailserver and Webserver hardening are addressed in other roles.

Windows:
* install EMET, Powershell v5
* LSA hardening, review javascript/hta file association
* review log settings, enabling command-line, powershell and WMI logging
* try to harden adobe reader, flash

Pay attention to test carefully role and fit to your context unless you want to lock yourself.
This role is continuous work in progress as security landscape is constantly evolving.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0 (required for Win)

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty and centos7
Windows part only tested against Win10 Evaluation

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - harden
```

Run
```
$ ansible-playbook -i inventory --limit linux site.yml
$ ansible-playbook -i inventory --limit win10 site.yml
```

## Variables

Sample. See defaults/main.yml for full scope

```
## Unix
#harden_logcheck_hours: '*'
harden_logcheck_hours: '6,18'
harden_use_rpc: false
harden_use_forwarding: false
harden_umask: '022'
#harden_umask: '027'

## Windows
## 300MB = 314572 (default in kb)
harden_eventlogs_maxsize: 314572
```

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/harden
$ kitchen verify
$ kitchen login
```
or
```
$ cd /path/to/roles/harden/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* On Windows, ensure you follow ansible guide to be able to connect
http://docs.ansible.com/ansible/intro_windows.html

## License

BSD 2-clause

