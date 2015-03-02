Pod::Spec.new do |s|

  s.name         = "AlertCompatibility"
  s.version      = "0.0.1"
  s.summary      = "A generic API for displaying an Alert or an ActionSheet that uses the UIAlertController on iOS 8 and UIAlertView or UIActionSheet on iOS 7 and below."

  s.description  = <<-DESC
                   Written in Swift.
                   DESC

  s.homepage     = "https://github.com/apploft/AlertCompatibility"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  
  s.author       = { "Michael Kamphausen" => "michael.kamphausen@apploft.de" }
  
  s.platform     = :ios, "8.0"
  
  s.ios.deployment_target = '8.0'

  s.source       = { :git => "https://github.com/apploft/AlertCompatibility.git", :tag => s.version.to_s }

  s.source_files = "Source/*.swift"
  
  s.requires_arc = true
  
  s.dependency 'UIAlertView+Blocks', '~> 0.8'
	s.dependency 'UIActionSheet+Blocks', '~> 0.8'

end
