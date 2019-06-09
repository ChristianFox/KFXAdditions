
Pod::Spec.new do |s|
  s.name             = "KFXAdditions"
  s.version          = "2.3.1"
  s.summary          = "A collection of categories on Foundation & Cocoa classes."

  s.description      = <<-DESC
A collection of categories on Foundation & Cocoa classes. Including: NSString,NSArray, UIResponder, UIApplication.
                       DESC

  s.homepage         = "https://github.com/ChristianFox/KFXAdditions.git"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Christian Fox" => "christianfox@kfxtech.com" }
  s.source           = { :git => "https://github.com/ChristianFox/KFXAdditions.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files =
    'KFXAdditions/Classes/CoreLocation/**/*',
    'KFXAdditions/Classes/Foundation/**/*',
    'KFXAdditions/Classes/UIKit/**/*',
    'KFXAdditions/Classes/MKMapKit/**/*'

end

