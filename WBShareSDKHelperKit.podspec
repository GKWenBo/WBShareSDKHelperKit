Pod::Spec.new do |s|
  s.name             = 'WBShareSDKHelperKit'
  s.version          = '1.1.0'
  s.summary          = 'QQ、微信、新浪三方分享封装'
  s.homepage         = 'https://github.com/wenmobo/WBShareSDKHelperKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wenmobo' => '1050794513@qq.com' }
  s.source           = { :git => 'https://github.com/wenmobo/WBShareSDKHelperKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'WBShareSDKHelperKit/Classes/**/*'
  s.requires_arc = true
  s.dependency 'mob_sharesdk', '>= 4.3.3'
  s.dependency 'mob_sharesdk/ShareSDKUI', '>= 4.3.3'
  s.dependency 'mob_sharesdk/ShareSDKPlatforms/QQ', '>= 4.3.3'
  s.dependency 'mob_sharesdk/ShareSDKPlatforms/SinaWeibo', '>= 4.3.3'
  s.dependency 'mob_sharesdk/ShareSDKPlatforms/WeChat', '>= 4.3.3'
  s.dependency 'mob_sharesdk/ShareSDKExtension', '>= 4.3.3'
  s.frameworks = 'UIKit'
end
