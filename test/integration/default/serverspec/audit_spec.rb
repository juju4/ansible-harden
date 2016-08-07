require 'serverspec'

# Required by serverspec
set :backend, :exec

describe linux_audit_system, :if => os[:family] == 'redhat' do
  it { should be_running }
  it { should be_enabled }
end

describe file('/etc/audit/audit.rules'), :if => os[:family] == 'ubuntu' do
  it { should contain '-w /etc/modprobe.conf -p wa -k modprobe' }
end
describe file('/etc/audit/rules.d/audit.rules'), :if => os[:family] == 'redhat' do
  it { should contain '-w /etc/modprobe.conf -p wa -k modprobe' }
end
