
Pod::Spec.new do |s|
  s.name             = "KFXAdditions"
  s.version          = "1.1.0"
  s.summary          = "A collection of categories on Foundation & Cocoa classes."

  s.description      = <<-DESC
A collection of categories on Foundation & Cocoa classes. Including: NSString,NSArray, UIResponder, UIApplication.
                       DESC

  s.homepage         = "https://kfxtech@bitbucket.org/kfx_pods/kfxadditions.git"
  s.license          = { :type => 'Commercial', :file => 'LICENSE' }
  s.author           = { "Christian Fox" => "christianfox890@icloud.com" }
  s.source           = { :git => "https://kfxtech@bitbucket.org/kfx_pods/kfxadditions.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files =
    'KFXAdditions/Classes/CoreLocation/**/*',
    'KFXAdditions/Classes/Foundation/**/*',
    'KFXAdditions/Classes/UIKit/**/*'



end

