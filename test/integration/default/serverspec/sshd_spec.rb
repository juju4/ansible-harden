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

describe port(22) do
  it { should be_listening }
end

describe file('/etc/ssh/sshd_config') do
  it { should contain 'PasswordAuthentication no' }
  it { should contain 'PermitRootLogin without-password' }
end
