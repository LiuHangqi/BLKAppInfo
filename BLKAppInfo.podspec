
Pod::Spec.new do |s|
  s.name             = 'BLKAppInfo'
  s.version          = '0.1.0'
  s.summary          = '便利客设备及应用信息'

  s.description      = <<-DESC
  Add long description of the pod here.
                       DESC
  s.homepage = 'https://git.oschina.net/henrylio/BLKAppInfo.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liu' => 'liuhangqi@live.com' }
s.source           = { :git => 'https://git.oschina.net/henrylio/BLKAppInfo.git' ,:tag => s.version }

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
