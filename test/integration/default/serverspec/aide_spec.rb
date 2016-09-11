require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/etc/aide.conf'), :if => os[:family] == 'redhat' do
  it { should be_file }
end
describe file('/etc/aide/aide.conf'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
  it { should be_file }
end
#describe file('/etc/cron.daily/aide'), :if => os[:family] == 'ubuntu' || os[:family] == 'debian' do
describe file('/etc/cron.daily/aide') do
  it { should be_file }
end

if ENV['SERVERSPEC_CHECK_AIDEDB']
    describe file('/var/lib/aide/aide.db') do
      it { should be_file }
    end
end

