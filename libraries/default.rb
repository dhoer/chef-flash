# Flash Player
module Flash
  # Internet Explorer
  module IE
    class << self
      #  Flash is pre-installed but not enabled on Windows Server 2012+
      def flash_enabled_by_default?
        return unless platform?('windows')
        require 'chef/win32/version'
        windows_version = Chef::ReservedNames::Win32::Version.new
        !(flash_preinstalled_on_ie? && windows_version.marketing_name.match(/Windows Server/))
      end

      #  Flash is pre-installed on Windows 8+ and Windows Server 2012+
      def flash_preinstalled?
        return unless platform?('windows')
        cat_version >= 62
      end

      private

      # Catenate Windows major and minor version e.g., 6.2.6099 -> 62
      def cat_version
        ver_array = node['platform_version'].split('.')
        "#{ver_array[0]}#{ver_array[1]}".to_i
      end
    end
  end
end unless defined?(Flash::IE) # https://github.com/sethvargo/chefspec/issues/562
