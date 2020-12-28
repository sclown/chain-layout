Pod::Spec.new do |s|
  s.name             = 'ChainLayout'
  s.version          = '0.2.0'
  s.summary          = 'Layout helpers with chained calls'

  s.description      = 'UIView extension to create NSLayoutConstrains and manage them'

  s.homepage         = 'https://github.com/sclown/chain-layout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dmitry Kurkin' => 'kurd1983@gmail.com' }
  s.source           = { :git => 'https://github.com/sclown/chain-layout.git', :tag => s.version.to_s }
  
  s.swift_version = '5.0'
  s.ios.deployment_target = '9.0'

  s.source_files = 'ChainLayout/**/*'
  
  s.frameworks = 'UIKit'
end
