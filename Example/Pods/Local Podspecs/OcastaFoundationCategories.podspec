#
# Be sure to run `pod lib lint OcastaFoundationCategories.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "OcastaFoundationCategories"
  s.version          = "0.1.0"
  s.summary          = "Useful categories for the Foundation library"
  s.description      = <<-DESC
                       Useful categories for the Foundation library by Ocasta Studios
                       DESC
  s.homepage         = "https://github.com/ocastastudios/OcastaFoundationCategories"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Chris Birch" => "chris@ocastastudios.com" }
  s.source           = { :git => "https://github.com/ocastaStudios/OcastaFoundationCategories.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/ocastastudios'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  #s.resources = 'Pod/Assets/*.png'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
