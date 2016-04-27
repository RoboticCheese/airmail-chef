# Encoding: UTF-8

require 'spec_helper'

describe 'airmail::default' do
  let(:platform) { nil }
  let(:runner) { ChefSpec::SoloRunner.new(platform) }
  let(:chef_run) { runner.converge(described_recipe) }

  context 'Mac OS X platform' do
    let(:platform) { { platform: 'mac_os_x', version: '10.10' } }

    it 'installs the Airmail app' do
      expect(chef_run).to install_airmail('default')
    end
  end
end
