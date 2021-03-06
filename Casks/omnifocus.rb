cask 'omnifocus' do
  if MacOS.version <= :mountain_lion
    version '1.10.6'
    sha256 'bd3aa44dced86fc3921c01f4467422a7b87a92afbd4be642ea4d4bb8b14b728c'
    url "https://downloads.omnigroup.com/software/MacOSX/10.6/OmniFocus-#{version}.dmg"
  elsif MacOS.version <= :mavericks
    version '2.0.4'
    sha256 '3282eb7e41ec2638f68a92a6509eddd96a96c39b65b954dcedcc4e62289f22a9'
    url "https://downloads.omnigroup.com/software/MacOSX/10.9/OmniFocus-#{version}.dmg"
  else
    version '2.7'
    sha256 '5026c8ce1fe7e03b5085f0d3ad6df2d57d03e58d6391e4fec44d0c53882f5e62'
    url "https://downloads.omnigroup.com/software/MacOSX/10.10/OmniFocus-#{version}.dmg"
  end

  name 'OmniFocus'
  homepage 'https://www.omnigroup.com/omnifocus/'
  license :commercial

  app 'OmniFocus.app'

  if MacOS.version <= :mountain_lion
    uninstall quit: 'com.omnigroup.OmniFocus'
    zap delete: [
                  '~/Library/Application Support/OmniFocus/Plug-Ins',
                  '~/Library/Application Support/OmniFocus/Themes',
                  '~/Library/Preferences/com.omnigroup.OmniFocus.plist',
                ]
  else
    uninstall quit: 'com.omnigroup.OmniFocus2'
    zap delete: [
                  '~/Library/Containers/com.omnigroup.OmniFocus2',
                  '~/Library/Preferences/com.omnigroup.OmniFocus2.LSSharedFileList.plist',
                  '~/Library/Preferences/com.omnigroup.OmniSoftwareUpdate.plist',
                  '~/Library/Caches/Metadata/com.omnigroup.OmniFocus2',
                  '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.omnigroup.omnifocus2.sfl',
                  '~/Library/Group Containers/34YW5XSRB7.com.omnigroup.OmniFocus',
                  '~/Library/Saved Application State/com.omnigroup.OmniFocus2.savedState',
                ]
  end
end
