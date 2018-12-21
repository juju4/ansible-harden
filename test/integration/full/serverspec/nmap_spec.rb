require 'serverspec'

set :backend, :exec

### local or remote?
##describe command('nmap -A -n 127.0.0.1') do
#describe command('ssh vascanner nmap -A -n 127.0.0.1') do
#  its(:exit_status) { should eq 0 }
#
### https://speakerdeck.com/garethr/an-introduction-to-testing-infrastructure
### ?http://sysadvent.blogspot.ca/2013/12/day-21-making-web-secure-one-unit-test.html
## https://dzone.com/articles/making-web-secure-one-unit
#  it 'has only a limited number of open ports' do
#    expect(@open_ports.count).to eq(3)
#  end
#  it 'exposes an SSH server' do
#    expect(@open_ports).to include('22/tcp')
#  end
#  it 'rejects email traffic' do
#    expect(@closed_ports).to include('25/tcp')
#  end
#
#end

