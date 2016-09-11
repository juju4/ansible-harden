require 'serverspec'

# Required by serverspec
set :backend, :exec

context 'entropy' do
  it "should be greater than #{300}" do
    expect(`cat /proc/sys/kernel/random/entropy_avail`.to_i).to be >= 300
  end 
end
