major_version = node['flash']['version'].split('.')[0]
system = node['kernel']['machine'] == 'x86_64' ? 'SysWow64' : 'System32'

if platform?('windows')
  windows_package "Adobe Flash Player #{major_version} ActiveX" do
    source "#{node['flash']['download_url']}/#{node['flash']['version']}/"\
      "install_flash_player_#{major_version}_active_x.msi"
    options '/qn'
    installer_type :custom
    only_if { node['flash']['install_activex'] }
  end

  windows_package "Adobe Flash Player #{major_version} NPAPI" do
    source "#{node['flash']['download_url']}/#{node['flash']['version']}/"\
      "install_flash_player_#{major_version}_plugin.msi"
    options '/qn'
    installer_type :custom
    only_if { node['flash']['install_npapi'] }
  end

  windows_package "Adobe Flash Player #{major_version} PPAPI" do
    source "#{node['flash']['download_url']}/#{node['flash']['version']}/install_flash_player_ppapi.exe"
    options '-install'
    installer_type :custom
    only_if { node['flash']['install_ppapi'] }
  end

  # The Global FlashPlayerTrust directory
  trust_dir = "%WINDIR%\\#{system}\\Macromed\\FlashPlayerTrust"

  directory trust_dir

  file "#{trust_dir}\\ChefGeneratedTrust.cfg" do
    content node['flash']['trust'].join('\r\n')
    mode '0755'
  end

  # Privacy and security settings (mms.cfg)
  mms_cfg_path = "%WINDIR%\\#{system}\\Macromed\\Flash\\mms.cfg"

  ruby_block "Manage #{mms_cfg_path}" do
    block do
      file = Chef::Util::FileEdit.new(mms_cfg_path)
      node['flash']['mms_cfg'].each do |k, v|
        file.search_file_replace_line(/#{k}/, "#{k} = #{v}")
        file.insert_line_if_no_match(/#{k}/, "#{k} = #{v}")
      end
      file.write_file
    end
  end
else
  Chef::Log.warn("Platform #{node['platform']} not supported!")
end
