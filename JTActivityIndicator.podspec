Pod::Spec.new do |s|
  s.name         = "JTActivityIndicator"
  s.version      = "0.0.1"
  s.summary      = "JTActivityIndicator is a flexible Activity Indicator"
  s.homepage     = "https://github.com/ifobos/JTActivityIndicator"
  s.license      = "MIT"
  s.author       = { "ifobos" => "juancarlos.garcia.alfaro@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/ifobos/JTActivityIndicator.git", :tag => "0.0.1" }
  s.source_files = "JTActivityIndicator/JTActivityIndicator/PodFiles/*.swift"
  s.resources    = "JTActivityIndicator/JTActivityIndicator/PodFiles/*.{png,bundle,xib,nib}"
  s.requires_arc = true
end
