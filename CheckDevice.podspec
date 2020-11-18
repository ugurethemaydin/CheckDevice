#
# Be sure to run `pod lib lint CheckDevice.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CheckDevice'
  s.version          = '1.0.2'
  s.summary          = 'CheckDevice is detected the current  device model and screen sizes.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  How to detect iOS device models and screen size? CheckDevice is detected the current apple device model and screen sizes.
                       DESC

  s.homepage         = 'https://github.com/ugurethemaydin/CheckDevice'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ugurethemaydin' => 'ugur@metromedya.com' }
  s.source           = { :git => 'https://github.com/ugurethemaydin/CheckDevice.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ugurethemaydin'

  s.ios.deployment_target = '10.3'
  s.swift_version = '4.0'
  s.source           =  { :git => 'https://github.com/ugurethemaydin/CheckDevice.git', :tag => s.version.to_s }
  s.source_files = 'Sources/CheckDevice/**/*'
  
  # s.resource_bundles = {
  #   'CheckDevice' => ['CheckDevice/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
