major_version = node['flash']['version'].split('.')[0] # returns major version e.g. version 20.0.0.267 would return 20

if platform?('windows')
  windows_package "Adobe Flash Player #{major_version} ActiveX" do
    source "#{node['flash']['download_url']}/#{node['flash']['version']}/"\
      "install_flash_player_#{major_version}_active_x.msi"
    options '/qn'
    installer_type :custom
    only_if { node['flash']['activex'] }
  end

  windows_package "Adobe Flash Player #{major_version} NPAPI" do
    source "#{node['flash']['download_url']}/#{node['flash']['version']}/"\
      "install_flash_player_#{major_version}_plugin.msi"
    options '/qn'
    installer_type :custom
    only_if { node['flash']['npapi'] }
  end

  windows_package "Adobe Flash Player #{major_version} PPAPI" do
    source "#{node['flash']['download_url']}/#{node['flash']['version']}/install_flash_player_ppapi.exe"
    options '/qn'
    installer_type :custom
    only_if { node['flash']['ppapi'] }
  end
else
  Chef::Log.warn("Platform #{node['platform']} not supported!")
end
