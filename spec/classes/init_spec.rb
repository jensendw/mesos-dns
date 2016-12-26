require 'spec_helper'
describe 'mesosdns' do
  let :facts do
    {
      service_provider: 'systemd',
      path: '/bin:/usr/bin',
    }
  end
  let :params do
    {
      mesos_zk: 'zk://localhost/test'
    }
  end
  context 'with defaults for all parameters' do
    it { should compile }
    it { should contain_class('mesosdns') }
  end
end

describe 'mesosdns' do
  let :facts do
    {
      service_provider: 'systemd',
      path: '/bin:/usr/bin',
    }
  end
  let :params do
    {
      ensure: 'absent'
    }
  end
  context 'with ensure is absent' do
    it { should compile }
    it { should contain_class('mesosdns') }
  end
end
