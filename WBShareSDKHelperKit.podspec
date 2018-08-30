Pod::Spec.new do |s|
  s.name             = 'WBShareSDKHelperKit'
  s.version          = '1.0.0'
  s.summary          = '三方分享封装'
  s.homepage         = 'https://gitee.com/wenmobo/WBShareSDKHelperKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wenmobo' => '1050794513@qq.com' }
  s.source           = { :git => 'https://gitee.com/wenmobo/WBShareSDKHelperKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'WBShareSDKHelperKit/Classes/**/*'
  s.requires_arc = true
  s.dependency 'mob_sharesdk'
  s.dependency 'mob_sharesdk/ShareSDKUI'
  s.dependency 'mob_sharesdk/ShareSDKPlatforms/QQ'
  s.dependency 'mob_sharesdk/ShareSDKPlatforms/SinaWeibo'
  s.dependency 'mob_sharesdk/ShareSDKPlatforms/WeChat'
  s.dependency 'mob_sharesdk/ShareSDKExtension'
  s.frameworks = 'UIKit'
end
