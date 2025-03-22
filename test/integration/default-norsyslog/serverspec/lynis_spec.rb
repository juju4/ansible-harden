require 'serverspec'

# Required by serverspec
set :backend, :exec

## Lynis2, ubuntu16.04 + centos71
describe command('lynis audit system -Q'), :if => os[:family] == 'ubuntu' && os[:release] == '16.04' do
  its(:stdout) { should match /Program version:/ }
#  its(:stderr) { should match /WARNING/ }
  its(:exit_status) { should eq 0 }
end
describe command('lynis audit system -Q'), :if => os[:family] == 'redhat' && os[:release] == '7' do
  its(:stdout) { should match /Program version:/ }
  its(:exit_status) { should eq 0 }
end

## Lynis1, ubuntu14.04
describe command('lynis -c -Q'), :if => os[:family] == 'ubuntu' && os[:release] == '14.04' do
  its(:stdout) { should match /Program version:/ }
  its(:exit_status) { should eq 0 }
end

## latest: https://cisofy.com/download/lynis/, https://cisofy.com/files/lynis-2.3.1.tar.gz
