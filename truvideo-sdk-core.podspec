Pod::Spec.new do |s|
  s.name                  = 'truvideo-sdk-core'
  s.version               = '1.0.0'
  s.summary               = 'Truvideo SDK for iOS'
  s.homepage              = 'https://github.com/Truvideo/truvideo-sdk-ios-core'
  s.license               = 'Commercial'
  s.author                = 'Truvideo'
  s.source                = { :http => "https://github.com/Truvideo/truvideo-sdk-ios-core/releases/download/#{s.version}/TruvideoSdk.zip" }
  s.ios.deployment_target = '15.0'
  s.swift_version         = '5.0'

  s.default_subspecs = 'Core'

  s.subspec 'Core' do |core|
    core.vendored_frameworks =
      'Frameworks/DI.xcframework',
      'Frameworks/TruVideoRuntime.xcframework',
      'Frameworks/TruVideoFoundation.xcframework',
      'Frameworks/Networking.xcframework',
      'Frameworks/StorageKit.xcframework',
      'Frameworks/TruVideoApi.xcframework',
      'Frameworks/TruvideoSdk.xcframework'
  end

  s.subspec 'MediaUpload' do |upload|
    upload.dependency 'truvideo-sdk-core/Core'
    upload.vendored_frameworks = 'Frameworks/TruVideoMediaUpload.xcframework'
  end
  
  s.subspec 'Camera' do |camera|
    camera.dependency 'truvideo-sdk-core/MediaUpload'
    camera.vendored_frameworks = 'Frameworks/TruvideoSdkCamera.xcframework'
  end
  
  s.subspec 'Media' do |media|
    media.dependency 'truvideo-sdk-core/MediaUpload'
    media.vendored_frameworks = 'Frameworks/TruvideoSdkMedia.xcframework'
  end
  
  s.subspec 'Video' do |video|
    video.dependency 'truvideo-sdk-core/Core'
    video.vendored_frameworks =
    'Frameworks/TruvideoSdkVideo.xcframework',
    'Frameworks/ffmpegkit.xcframework',
    'Frameworks/libavcodec.xcframework',
    'Frameworks/libavdevice.xcframework',
    'Frameworks/libavfilter.xcframework',
    'Frameworks/libavformat.xcframework',
    'Frameworks/libavutil.xcframework',
    'Frameworks/libswresample.xcframework',
    'Frameworks/libswscale.xcframework'
  end
end