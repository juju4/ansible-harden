require 'serverspec'

# Required by serverspec
set :backend, :exec

describe linux_audit_system, :if => os[:family] == 'redhat' do
  it { should be_running }
  it { should be_enabled }
end


