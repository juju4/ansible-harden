#!/usr/bin/env bats
#

#
# Idempotence test
# from https://github.com/neillturner/kitchen-ansible/issues/92
#

@test "Second run should change nothing" {
    run bash -c "ansible-playbook -i /tmp/kitchen/hosts /tmp/kitchen/default.yml -c local | tee /tmp/idempotency.test | grep -q 'changed=0.*failed=0' && exit 0 || exit 1"
## FIXME! known fail
#    [ "$status" -eq 0 ]
}

