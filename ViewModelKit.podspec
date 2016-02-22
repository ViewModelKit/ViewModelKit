Pod::Spec.new do |s|
  s.name        = "ViewModelKit"
  s.version     = "0.0.1"
  s.summary     = "ViewModelKit makes it easy to deal with ViewModel in Swift"
  s.homepage    = "https://github.com/ViewModelKit/ViewModelKit"
  s.license     = { :type => "MIT" }
  s.authors     = { "xutongtong" => "xushao1990@126.com" }

  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/ViewModelKit/ViewModelKit.git", :tag => s.version }
  s.source_files = "Source/*.swift"
end