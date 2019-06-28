Pod::Spec.new do |s|  
    s.name              = 'MURLRouter'
    s.version           = '0.0.1'
    s.summary           = 'URL Routing'
    s.homepage          = 'https://github.com/Mammadbayli/URLRouter'

    s.author            = { 'Name' => 'javad@mammadbayli.com' }
    s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :http => 'https://github.com/Mammadbayli/URLRouter/blob/master/URLRouter.zip?raw=true' }

    s.ios.deployment_target = '8.0'
    s.ios.vendored_frameworks = 'URLRouter.framework'
end  
