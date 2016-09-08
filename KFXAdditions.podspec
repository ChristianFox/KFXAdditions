#
# Be sure to run `pod lib lint KFXAdditions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "KFXAdditions"
  s.version          = "0.6.0"
  s.summary          = "A collection of categories on Foundation & Cocoa classes."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A collection of categories on Foundation & Cocoa classes. Including: NSString,NSArray, UIResponder, UIApplication.
                       DESC

  s.homepage         = "https://kfxtech@bitbucket.org/kfxtech/kfxadditions_pod_private.git"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Christian Fox" => "christianfox890@icloud.com" }
  s.source           = { :git => "https://kfxtech@bitbucket.org/kfxtech/kfxadditions_pod_private.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KFXAdditions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KFXAdditions' => ['KFXAdditions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
