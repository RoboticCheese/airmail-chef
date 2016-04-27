require_relative '../../../spec_helper'

describe 'resource_airmail::mac_os_x::10_10' do
  let(:action) { nil }
  let(:runner) do
    ChefSpec::SoloRunner.new(step_into: 'airmail',
                             platform: 'mac_os_x',
                             version: '10.10')
  end
  let(:chef_run) do
    runner.converge("resource_airmail_test::#{action}")
  end

  context 'the default action (:install)' do
    let(:action) { :default }

    it 'configures the Mac App Store' do
      expect(chef_run).to include_recipe('mac-app-store')
    end

    it 'installs the Airmail app' do
      expect(chef_run).to install_airmail('default')
    end

    it 'installs via the App Store' do
      expect(chef_run).to install_mac_app_store_app('Airmail 2.6')
        .with(bundle_id: 'it.bloop.airmail2')
    end
  end
end
