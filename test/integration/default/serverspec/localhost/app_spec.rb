# Encoding: UTF-8

require_relative '../spec_helper'

describe 'airmail::default::app' do
  describe package('it.bloop.airmail2') do
    it 'is installed' do
      expect(subject).to be_installed.by(:pkgutil)
    end
  end

  describe file('/Applications/Airmail 2.app') do
    it 'is present on the filesystem' do
      expect(subject).to be_directory
    end
  end
end
