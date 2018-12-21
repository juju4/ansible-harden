require 'serverspec'

# Required by serverspec
set :backend, :exec

context 'memory' do
  it "should be greater than #{512}" do
    expect(`cat /proc/meminfo`[/MemTotal:\s+(\d+)/, 1].to_i).to be >= 512
  end 
end

