# Encoding: utf-8

require_relative 'spec_helper'

describe 'flash::default' do
  describe 'windows' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(::WINDOWS_OPTS) do |node|
        node.set['flash']['trust'] = ['# comment', 'C:\trust\directory']
      end.converge(described_recipe)
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

    it 'creates FlashPlayerTrust directory' do
      expect(chef_run).to create_directory('%WINDIR%\SysWow64\Macromed\FlashPlayerTrust')
    end

    it 'creates ChefGeneratedTrust.cfg' do
      expect(chef_run).to create_file('%WINDIR%\SysWow64\Macromed\FlashPlayerTrust\ChefGeneratedTrust.cfg').with(
        content: '# comment\r\nC:\trust\directory',
        mode: '0755'
      )
    end

    it 'manages mms.cfg' do
      expect(chef_run).to run_ruby_block('Manage %WINDIR%\SysWow64\Macromed\Flash\mms.cfg')
    end
  end
end
