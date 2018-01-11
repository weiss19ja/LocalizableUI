#
#  Be sure to run `pod spec lint LocalizableUI.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "LocalizableUI"
  s.version      = "0.3.6"
  s.summary      = "LocalizableUI is a library to handle localization of a app directly in xcode interface builder and for supporting custom language changes."

  s.description  = <<-DESC
This library was created to set the localized key of the UI elements directly in the interface builder of xcode. It supports all kind of UI elements for iOS and offers localized keys for all common text properties. The localization of the elements is fully handled by the library.
Another feature of the library are custom language changes. The changes can be done by specifing another string table and the library will do all further steps for you.
                   DESC

  s.homepage     = "https://github.com/weiss19ja/LocalizableUI"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Jan Weiss" => "weiss19ja@gmail.com", "Philipp Weiss" => "philipp307@gmail.com" }
  # s.social_media_url   = "http://twitter.com/weiss19ja"

  s.ios.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/weiss19ja/LocalizableUI.git", :tag => "#{s.version}" }

  s.source_files  = "LocalizableUI/**/*.swift"
  # s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

end
