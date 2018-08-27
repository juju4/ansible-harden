require 'serverspec'

# Required by serverspec
set :backend, :exec

pkg_list = [ 'rkhunter', 'acct', 'sysstat', 'acl' ]

for p in pkg_list do
    describe package("#{p}"), :if => os[:family] == 'ubuntu' || os[:family] == 'debian'  do
      it { should be_installed }
    end
end

