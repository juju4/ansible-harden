require 'serverspec'

# Required by serverspec
set :backend, :exec

## FIXME! no auditd in containers, serverspec container identification?
#describe linux_audit_system, :if => os[:family] == 'redhat' do
#  it { should be_running }
#  it { should be_enabled }
#end
## http://kb.plesk.com/en/121587	not executable in containers
## https://github.com/test-kitchen/test-kitchen/issues/174	Have access to node attributes in tests = NOK
## http://www.hurryupandwait.io/blog/accessing-chef-node-attributes-from-kitchen-tests
#describe linux_audit_system, :if => os[:family] == 'ubuntu' && node['virtualization'][:system] != 'lxc' do
#  it { should be_running }
#  it { should be_enabled }
#end
#describe command('auditctl -R /etc/audit/audit.rules') do
#  its(:exit_status) { should eq 0 }
#end

#describe file('/etc/audit/audit.rules'), :if => os[:family] == 'ubuntu' && os[:release] != '16.04' do
#  it { should contain '-w /etc/modprobe.conf -p wa -k modprobe' }
#end
#describe file('/etc/audit/rules.d/audit.rules'), :if => os[:family] == 'redhat' do
#  it { should contain '-w /etc/modprobe.conf -p wa -k modprobe' }
#end
