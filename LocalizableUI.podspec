#
# Be sure to run `pod lib lint LocalizableUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LocalizableUI'
  s.version          = '0.1.0'
  s.summary          = 'LocalizableUI is a library to handle localization of a app directly in xcode interface builder and for supporting custom language changes.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library was created to set the localized key of the UI elements directly in the interface builder of xcode. It supports all kind of UI elements for iOS and offers localized keys for all common text properties. The localization of the elements is fully handled by the library.
Another feature of the library are custom language changes. The changes can be done by specifing another string table and the library will do all further steps for you.
                       DESC

  s.homepage         = 'https://github.com/weiss19ja/LocalizableUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jan Weiß' => 'weiss19ja@gmail.com' }
  s.source           = { :git => 'https://github.com/Jan Weiß/LocalizableUI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LocalizableUI/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LocalizableUI' => ['LocalizableUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
