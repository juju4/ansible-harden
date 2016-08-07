[![Build Status](https://travis-ci.org/juju4/ansible-harden.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden)
# harden ansible role

Ansible role to harden system and make it more forensics friendly (linux only). Few task example below.

Unix
* SSH key only
* (debian) Immutable system directory
/lib /etc/init.d /boot are tagged immutable
/etc/apt/apt.conf.d/99security allows to handle gracefully update inside apt but else you will need to handle manually.
* block usb and firewire drivers
* bash commands sent to syslog

Mailserver, Webserver, Darwin, OpenBSD and other hardening are addressed in other roles.

Pay attention to test carefully role and fit to your context unless you want to lock yourself.
This role is continuous work in progress as security landscape is constantly evolving.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test vagrant or lxd, Travis.

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

* Tests has been mostly on Ubuntu trusty and xenial so coverage might be not equivalent for other distributions.
* You are also advise to check projects like https://github.com/dev-sec
Some tasks are better covered there like suid/sgid binaries cleaning and inspec control testing.

## License

BSD 2-clause

