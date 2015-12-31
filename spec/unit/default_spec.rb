# Encoding: utf-8

require_relative 'spec_helper'

describe 'flash::default' do
  describe 'windows' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(::WINDOWS_OPTS).converge(described_recipe)
    end

    it 'installs for Internet Explorer - ActiveX' do
      expect(chef_run).to install_windows_package('Adobe Flash Player 20 ActiveX')
    end

    it 'installs for Firefox - NPAPI' do
      expect(chef_run).to install_windows_package('Adobe Flash Player 20 NPAPI')
    end

    it 'installs for Chome and Opera - PPAPI' do
      expect(chef_run).to install_windows_package('Adobe Flash Player 20 PPAPI')
    end
  end
end
