Pod::Spec.new do |s|
  s.name         = "KITextAttachment"
  s.version      = "0.1.0"
  s.summary      = "NSTextAttachment subclass for iOS 7+ that allows images to be drawn in text with blocks."
  s.description  = <<-DESC
                   KITextAttachment allows you attach images that will appear inline within blocks of text. The images are provided by implementing a block that draws into the an CGContextRef rather than providing a UIImage.
                   DESC
  s.homepage     = "https://github.com/Krelborn/KITextAttachment"
  s.screenshots  = "https://raw.githubusercontent.com/Krelborn/KITextAttachment/master/Screenshot.png"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Matt Styles" => "matt@compiledcreations.com" }
  s.social_media_url   = "http://twitter.com/Krelborn"

  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Krelborn/KITextAttachment.git", :tag => "0.1.0" }
  s.source_files  = "KITextAttachment/Classes/**/*.{h,m}"
  public_header_files = "KITextAttachment/Classes/**/*.h"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
