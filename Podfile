# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def rx_swift
    pod 'RxSwift', '~> 4.0'
end

def rx_cocoa
    pod 'RxCocoa', '~> 4.0'
end

def test_pods
    pod 'RxTest'
    pod 'RxBlocking'
    pod 'Nimble'
end

target 'CleanArchitecture' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for CleanArchitecture
  rx_cocoa
  rx_swift
  pod 'QueryKit'

  target 'CleanArchitectureTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end

  target 'CleanArchitectureUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Domain' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Domain
  rx_swift

  target 'DomainTests' do
    inherit! :search_paths
    # Pods for testing
    test_pods
  end

end

target 'NetworkPlatform' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    rx_swift
    pod 'Alamofire'
    pod 'RxAlamofire'
    
    target 'NetworkPlatformTests' do
        inherit! :search_paths
        test_pods
    end
    
end

target 'CoreDataPlatform' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    rx_swift
    pod 'QueryKit'
    target 'CoreDataPlatformTests' do
        inherit! :search_paths
        test_pods
    end
    
end
