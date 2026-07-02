Pod::Spec.new do |s|
  s.name                  = 'truvideo-sdk-core'
  s.version               = '1.0.5-RC.3'
  s.summary               = 'Truvideo SDK for iOS'
  s.homepage              = 'https://github.com/Truvideo/truvideo-sdk-ios-core'
  s.license               = 'Commercial'
  s.author                = 'Truvideo'
  s.source                = { :http => "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/1.0.5-RC.3/TruvideoSdk.zip" }
  s.ios.deployment_target = '15.0'
  s.swift_version         = '5.0'

  s.dependency 'AWSS3'
  s.dependency 'AWSCore'
  s.dependency 'AWSCognitoIdentityProvider'
  s.dependency 'AWSCognitoIdentityProviderASF'
  s.dependency 'NCKit', '1.2.1'

  s.default_subspecs = 'Core'

  s.subspec 'Core' do |core|
    core.vendored_frameworks = [
      'Frameworks/TruvideoSdk.xcframework', 
      'Frameworks/shared.xcframework'
    ]
  end

  s.subspec 'MediaProcessing' do |processing|
    processing.dependency 'truvideo-sdk-core/Core'
    processing.dependency 'NCKit'
    processing.vendored_frameworks = [
    'Frameworks/TruVideoMediaProcessing.xcframework',
    'Frameworks/ffmpegkit.xcframework',
    'Frameworks/libavcodec.xcframework',
    'Frameworks/libavdevice.xcframework',
    'Frameworks/libavfilter.xcframework',
    'Frameworks/libavformat.xcframework',
    'Frameworks/libavutil.xcframework',
    'Frameworks/libswresample.xcframework',
    'Frameworks/libswscale.xcframework'
   ]
  end

  s.subspec 'MediaUpload' do |upload|
    upload.dependency 'truvideo-sdk-core/Core'
    upload.dependency 'AWSS3'
    upload.dependency 'AWSCore'
    upload.dependency 'AWSCognitoIdentityProvider'
    upload.dependency 'AWSCognitoIdentityProviderASF'
    upload.vendored_frameworks = 'Frameworks/TruVideoMediaUpload.xcframework'
  end
  
  s.subspec 'Camera' do |camera|
    camera.dependency 'truvideo-sdk-core/MediaUpload'
    camera.dependency 'truvideo-sdk-core/MediaProcessing'
    camera.vendored_frameworks = 'Frameworks/TruvideoSdkCamera.xcframework'
  end
  
  s.subspec 'Image' do |image|
    image.dependency 'truvideo-sdk-core/Core'
    image.vendored_frameworks = 'Frameworks/TruvideoSdkImage.xcframework'
  end
  
  s.subspec 'Media' do |media|
    media.dependency 'truvideo-sdk-core/MediaUpload'
    media.vendored_frameworks = 'Frameworks/TruvideoSdkMedia.xcframework'
  end
  
  s.subspec 'Video' do |video|
    video.dependency 'truvideo-sdk-core/Core'
    video.dependency 'truvideo-sdk-core/MediaProcessing'
    video.vendored_frameworks = 'Frameworks/TruvideoSdkVideo.xcframework'
  end
end