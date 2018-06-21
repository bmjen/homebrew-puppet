cask 'pdk' do
  version '1.6.0.0'

  version_map = {
    high_sierra: { 
      sha: '582b746fc07829f5e89c3ef5c937a86e318444f166ee0afa9b7add12d0acf2a6',
      ver: '10.13'
    },
    sierra: {
      sha: '304d7c765b82f3e552b2023c5401be85085abec2c99af4f16918cf7fd7007cbd',
      ver: '10.12'
    },
    el_capitan: {
      sha: 'b1c044e7425a28ea796c33876f6c8f43e5f1dc4c536d93a0b168cb14be1800ba',
      ver: '10.11'
    }
  }

  case MacOS.version
  when :high_sierra
    sha = version_map[:high_sierra][:sha]
    os_ver = version_map[:high_sierra][:ver]
  when :sierra
    sha = version_map[:sierra][:sha]
    os_ver = version_map[:sierra][:ver]
  else
    sha = version_map[:el_capitan][:sha]
    os_ver = version_map[:el_capitan][:ver]
  end

  sha256 sha
  url "https://puppet-pdk.s3.amazonaws.com/pdk/#{version}/repos/apple/#{os_ver}/PC1/x86_64/pdk-#{version}-1.osx#{os_ver}.dmg"

  name 'Puppet Development Kit'
  homepage 'https://github.com/puppetlabs/pdk'

  depends_on macos: '>= :el_capitan'

  pkg "pdk-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.pdk'
end
