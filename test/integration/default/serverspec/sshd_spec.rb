require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('sshd'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe service('ssh'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

## precise does not support 'ss' call used by serverspec ('TCPDIAG answers: Operation not supported')
describe port(22), :if => os[:family] == 'ubuntu' && os[:release] != '12.04' do
  it { should be_listening }
end
describe port(22), :if => os[:family] == 'redhat' do
  it { should be_listening }
end

describe file('/etc/ssh/sshd_config') do
  it { should contain 'PasswordAuthentication no' }
  it { should contain 'PermitRootLogin without-password' }
end
