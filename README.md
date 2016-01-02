# Flash Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/flash.svg?style=flat-square)][supermarket]
[![Build Status](http://img.shields.io/travis/dhoer/chef-flash.svg?style=flat-square)][travis]

[supermarket]: https://supermarket.chef.io/cookbooks/flash
[travis]: https://travis-ci.org/dhoer/chef-flash

Installs Adobe Flash Player for Internet Explorer - ActiveX, Firefox - NPAPI, and Chrome and Opera - PPAPI.

Please submit a Pull Request if you would like to add support for Linux, Mac OS X, ESR, Debug or Projector.

## Requirements

- Chef 11+

### Platforms

- Windows

### Cookbooks

- windows

## Usage

By including this cookbook in a recipe or a run list, you are excepting 
[Adobe end-user license agreement (EULA)](http://www.adobe.com/products/eula/tools/flashplayer_usage.html).

### Attributes
* `node['flash']['install_activex']` - Install Flash Player for Internet Explorer.  Default `true`.
* `node['flash']['install_npapi']` - Install Flash Player for Firefox. Default `true`.
* `node['flash']['install_ppapi']` - Install Flash Player for Chrome and Opera. Default `true`.
* `node['flash]['trust']` - Specify an array of files or directories that should be trusted for all 
users, and be placed in a local-trusted sandbox. The Global FlashPlayerTrust file is created as
C:Windows\System32\Macromed\FlashPlayerTrust\ChefGeneratedTrust.cfg or
C:Windows\SysWow64\Macromed\FlashPlayerTrust\ChefGeneratedTrust.cfg for 32-bit or 64-bit Windows respectively. 
Default `[]`.
* `node['flash]['mms_cfg']` - Specify a hash of key value pairs to manage privacy and security settings in mms.cfg. 
The mms.cfg file managed is under C:Windows\System32\Macromed\Flash or
C:Windows\SysWow64\Macromed\Flash for 32-bit or 64-bit Windows respectively. Default `{}`.

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/flash).
- Report bugs and discuss potential features in [Github issues](https://github.com/dhoer/chef-flash/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-flash/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-flash/blob/master/LICENSE.md) file for details.
