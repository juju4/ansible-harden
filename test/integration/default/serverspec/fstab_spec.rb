require 'serverspec'

# Required by serverspec
set :backend, :exec

## standard kitchen setup has no separate /boot
#describe file('/etc/fstab') do
#  it { should contain '/boot.*nodev' }
#end
#describe command('mount') do
#  its(:stdout) { should contain '/boot.*nodev' }
#end

