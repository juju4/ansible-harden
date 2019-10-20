# frozen_string_literal: true

require 'serverspec'

# Required by serverspec
set :backend, :exec

describe service('rsyslog') do
  it { should be_enabled }
  it { should be_running }
end

describe process('rsyslogd') do
  it { should be_running }
  its(:count) { should eq 1 }
end

# describe port(514) do
#   it { should be_listening }
# end

describe file('/etc/rsyslog.conf'), :if => os[:family] != 'redhat' || !os[:release].match(/^8\./) do
  it { should contain '$IncludeConfig /etc/rsyslog.d/*.conf' }
end
describe file('/etc/rsyslog.conf'), :if => os[:family] == 'redhat' && os[:release].match(/^8\./) do
  it { should contain 'include(file="/etc/rsyslog.d/*.conf" mode="optional")' }
end
