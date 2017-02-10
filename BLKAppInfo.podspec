#
# Be sure to run `pod lib lint BLKAppInfo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BLKAppInfo'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BLKAppInfo.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/liu/BLKAppInfo'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liu' => 'liuhangqi@live.com' }
  s.source           = { :git => '~/blkee_dev/BLKAppInfo' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BLKAppInfo/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BLKAppInfo' => ['BLKAppInfo/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking'
  s.dependency 'SSKeychain'
  s.dependency 'OpenUDID'
end
