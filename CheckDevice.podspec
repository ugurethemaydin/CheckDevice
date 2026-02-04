#
# Be sure to run `pod lib lint CheckDevice.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CheckDevice'
  s.version          = '2.0.3'
  s.summary          = 'Detect Apple device models, screen sizes, and capabilities.'

  s.description      = <<-DESC
  How to detect iOS device models and screen size? CheckDevice detects the current Apple device model and screen sizes.
  Supports all devices from iPhone Original (2007) to iPhone 17 (2025), all iPads, Apple Watch, and iPod Touch.
                       DESC

  s.homepage         = 'https://github.com/ugurethemaydin/CheckDevice'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ugurethemaydin' => 'ugur@metromedya.com' }
  s.source           = { :git => 'https://github.com/ugurethemaydin/CheckDevice.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ugurethemaydin'

  s.ios.deployment_target = '10.3'
  s.swift_version = '4.2'
  s.source_files = 'Sources/CheckDevice/**/*'

  s.frameworks = 'UIKit'
end
