[![Build Status](https://travis-ci.org/juju4/ansible-harden.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden)
# harden ansible role

A simple ansible role to harden system (linux, windows...)

* (debian) Immutable system directory
/lib /etc/init.d /boot are tagged immutable
/etc/apt/apt.conf.d/99security allows to handle gracefully update inside apt but else you will need to handle manually.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - harden
```

## Variables

Nothing specific for now.

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


## License

BSD 2-clause

