
Pod::Spec.new do |s|
  s.name             = 'OIDateManager'
  s.version          = '0.1.2'
  s.summary          = 'A short description of OIDateManager.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/awzw689/OIDateManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'awzw689' => 'awzw689@163.com' }
  s.source           = { :git => 'https://github.com/awzw689/OIDateManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'OIDateManager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'OIDateManager' => ['OIDateManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
# 如果需要引入第三方依赖，则添加下面一行（删掉 # ）
  # s.dependency 'AFNetworking', '~> 2.3'
end
