#
# Be sure to run `pod lib lint YDNavigationController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YDNavigationController'
  s.version          = '0.1.0'
  s.summary          = '自定义导航控制器'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
自定义导航控制器，实现每个控制器拥有一个单独的导航条
                       DESC
                       
  s.homepage         = 'https://github.com/herody/YDNavigationController.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'houyadi' => '314622981@qq.com' }
  s.source           = { :git => 'https://github.com/herody/YDNavigationController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.2'
  
  s.source_files = 'YDNavigationController/Classes/**/*'
  
  s.resource_bundles = {
    'YDNavigationController' => ['YDNavigationController/Assets/YDNavigationController.bundle']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
