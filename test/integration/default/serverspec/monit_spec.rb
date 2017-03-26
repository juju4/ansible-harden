require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('monit') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/monit/monitrc'), :if => os[:family] == 'ubuntu' do
  it { should be_file }
end
describe file('/etc/monit/conf.d/sshd'), :if => os[:family] == 'ubuntu' do
  it { should be_file }
end
describe file('/etc/monitrc'), :if => os[:family] == 'redhat' do
  it { should be_file }
end
describe file('/etc/monit.d/sshd'), :if => os[:family] == 'redhat' do
  it { should be_file }
end

