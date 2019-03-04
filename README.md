[![Build Status - Master](https://travis-ci.org/juju4/ansible-harden.svg?branch=master)](https://travis-ci.org/juju4/ansible-harden)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-harden.svg?branch=devel)](https://travis-ci.org/juju4/ansible-harden/branches)
# harden ansible role

Ansible role to harden system and make it more forensics friendly (linux only). Few task example below.

Unix
* SSH key only
* enable & configure auditd
* (debian) Immutable system directory
/lib /etc/init.d /boot are tagged immutable
/etc/apt/apt.conf.d/99security allows to handle gracefully update inside apt but else you will need to handle manually.
* block usb and firewire drivers
* bash commands sent to syslog

Sysctl, Mailserver, Webserver, Darwin, OpenBSD and other hardening are addressed in other roles.

Pay attention to test carefully role and fit to your context unless you want to lock yourself.
This role is continuous work in progress as security landscape is constantly evolving.

Legal disclaimer!
Depending on settings, very detailed activity log can be created.
Only apply to your own system else for most countries (ex: Europe), user must have been warned and agreed (usually through internal policy, code of conduct...)

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.2
 * 2.3
 * 2.5
Previous releases of ansible are not supported because of module usages.

### Operating systems

Tested on Ubuntu 14.04, 16.04, 18.04, Centos 7. Kitchen test vagrant or lxd, Travis.

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.harden
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
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.harden
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
$ . ~/.azure/credentials
$ KITCHEN_YAML=".kitchen.azure.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.harden/test/vagrant
$ vagrant up
$ vagrant ssh
```

Role has also a packer config which allows to create image for virtualbox and vmware based on https://github.com/jonashackt/ansible-windows-docker-springboot/ and https://github.com/boxcutter/windows.
Plan for about 50GB of free disk space and 1h to build one image.
```
$ cd /path/to/packer-build
$ cp -Rd /path/to/juju4.harden/packer .
## update packer-*.json with your current absolute ansible role path for the main role
$ cd packer
$ packer build *.json
$ packer build -only=virtualbox-iso *.json
## if you want to enable extra log
$ PACKER_LOG_PATH="packerlog.txt" PACKER_LOG=1 packer build *.json
# for Azure, add ansible.cfg with roles_path
$ . ~/.azure/credentials
$ packer build azure-packer-harden-centos7.json
$ packer build -var-file=variables.json azure-packer-harden-centos7.json
```

## FAQ

* Remove Haveged for RedHat7. Use Jitter Entropy RNG available since 7.4.
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7-Beta/html-single/7.4_Release_Notes/index.html#new_features_kernel

* Redhat7: using service to restart auditd
  * https://groups.google.com/forum/#!topic/ansible-project/pv1h1Ne7nSk
  * https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Security_Guide/sec-starting_the_audit_service.html

* Redhat7: pam_pwquality instead of pam_cracklib.
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/chap-hardening_your_system_with_tools_and_services#sec-Password_Security

* sudoers+selinux configuration?
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/selinux_users_and_administrators_guide/sect-security-enhanced_linux-targeted_policy-confined_and_unconfined_users#sect-Security-Enhanced_Linux-Targeted_Policy-Confined_and_Unconfined_Users-sudo_Transition_and_SELinux_Roles

* USB controls
  * Misc Magazine N°50, FR, Jul/Aug 2010
  * https://www.lexsi.com/securityhub/danse-des-canards/
  * https://security.stackexchange.com/questions/64524/how-to-prevent-badusb-attacks-on-linux-desktop
  * https://en.wikibooks.org/wiki/Grsecurity/Appendix/Grsecurity_and_PaX_Configuration_Options#Deny_new_USB_connections_after_toggle
  * https://github.com/dkopecek/usbguard
  * http://www.opensourceforu.com/2012/06/some-nifty-udev-rules-and-examples/
  * http://www.irongeek.com/i.php?page=security/plug-and-prey-malicious-usb-devices
  * Deny new USB devices when locked?
  * Alpine has no automount/autofs for storage
  * https://github.com/probablynotablog/usb-canary
  * (RHEL7.6+) https://access.redhat.com/articles/3230621

## Troubleshooting & Known issues

* Tests has been mostly on Ubuntu trusty and xenial so coverage might be not equivalent for other distributions.
* You are also advise to check projects like https://github.com/dev-sec
Some tasks are better covered there like suid/sgid binaries cleaning and inspec control testing.

* Canonical livepatch has some issues and may return ```canonical-livepatch: Bad server status code: 403. URL: https://livepatch.canonical.com/api/machine/xxx {"error": "Invalid Machine Token"}```
https://askubuntu.com/questions/844583/state-check-failed-when-running-canonical-livepatch
https://bugs.launchpad.net/ubuntu/+source/snapd/+bug/1642581

* vagrant (up phase only) and kitchen/ruby net-ssh have issues to initiate ssh connection after role play.
```
# kitchen log
Message: SSH command failed (could not settle on kex algorithm)
```
Implementation have older compatibility list. See
https://security.stackexchange.com/questions/90503/metasploit-ssh-error-could-not-settle-on-kex-algorithm
Normal ssh command line with recent releases should not be impacted. If required, review sshd cryptographic functions definitions inside vars/

* Kitchen Azure
  * above net-ssh issue with kex and hmac
  * Net::SSH:AuthenticationFailed: Authentication failed for user azure@xxx

## License

BSD 2-clause

## References

* CIS benchmarks (when was public)
* https://www.asd.gov.au/publications/protect/top_4_mitigations_linux.htm
* https://www.ncsc.gov.uk/guidance/eud-security-guidance-ubuntu-1604-lts
* https://www.ssi.gouv.fr/guide/recommandations-de-securite-relatives-a-un-systeme-gnulinux/
* experience, friends and colleagues, mailing-list and security community

See also
* https://github.com/dev-sec/ansible-os-hardening/
* https://docs.openstack.org/developer/ansible-hardening/

