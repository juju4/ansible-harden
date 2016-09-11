require 'serverspec'

# Required by serverspec
set :backend, :exec

#for p in rkhunter acct sysstat acl
#    describe package(#{p}), :if => os[:family] == 'ubuntu' || os[:family] == 'debian'  do
#      it { should be_installed }
#    end
#end

