Pod::Spec.new do |s|
s.name         = "exstendedAnimation"
s.version      = "0.0.1"
s.summary      = "Animations for all no discrimination."
s.license      = {:type => 'Commercial', :text => "Copyright (c) Dan Leonard. All rights reserved." }
s.author       = { "Dan Leonard" => "pdanielleonard@gmail.com" }
s.source       = { :git => "https://github.com/weave-lab/ios-commons.git", :tag => s.version.to_s }
s.homepage     = "https://github.com/weave-lab/ios-commons.git"
s.requires_arc = true

s.ios.deployment_target = '9.0'

s.subspec 'Core' do |ss|
ss.source_files = '*.swift'
end

s.subspec 'Menu' do |ss|
ss.source_files = 'Menu/*.swift'
ss.resources = ['Menu/*.storyboard', 'Menu/*.xcassets']
ss.dependency 'Alamofire'
ss.dependency 'uservoice-iphone-sdk'
end

s.subspec 'Login' do |ss|
ss.source_files = 'Login/*.swift'
ss.resources = ['Login/*.storyboard', 'Login/*.xcassets']
ss.dependency 'Alamofire'
ss.dependency 'SDWebImage'
ss.dependency 'KeychainSwift'
end

s.subspec 'Patients' do |ss|
ss.source_files = 'Patients/*.swift'
ss.resources = ['Patients/*.storyboard', 'Patients/*.xcassets']
ss.dependency 'Alamofire'
ss.dependency 'Swiftification'
ss.dependency 'SQLite.swift'
end
end