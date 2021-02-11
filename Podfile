# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Muvuca' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Muvuca
  pod 'SwiftLint'
  pod 'Firebase'
  pod 'Firebase/Database'
  pod 'Firebase/Storage'

  target 'MuvucaTests' do
    inherit! :search_paths
    pod 'Firebase'
    pod 'Firebase/Database'
    pod 'Firebase/Storage'
  end

  target 'MuvucaUITests' do
    pod 'Firebase'
    pod 'Firebase/Database'
    pod 'Firebase/Storage'
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
