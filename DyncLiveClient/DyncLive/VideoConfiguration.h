//
//  VideoConfiguration.h
//  liveflv
//
//  Created by jianqiangzhang on 16/6/23.
//  Copyright © 2016年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>
/// 视频分辨率(都是16：9 当此设备不支持当前分辨率，自动降低一级)
typedef NS_ENUM(NSUInteger, StreamingVideoSessionPreset){
    /// 低分辨率 24帧 512码率
    CaptureSessionPreset352x288 = 0,
    /// 中分辨率 24帧 512码率
    CaptureSessionPreset640x480_Low = 1,
    /// 中分辨率 24帧 768码率
    CaptureSessionPreset640x480_Hight = 2,
    /// 高分辨率 24帧 768码率
    CaptureSessionPreset960x540_Low = 3,
    /// 高分辨率 24帧 1024码率
    CaptureSessionPreset960x540_Hight = 4,
    
};
typedef NS_ENUM(NSInteger, CaptureDevicePosition) {
    CaptureDevicePositionBack                = 1,
    CaptureDevicePositionFront               = 2
};

typedef NS_ENUM(NSInteger, DevicePosition) {
    DeviceOrientationPortrait,
    DeviceOrientationPortraitUpsideDown,
    DeviceOrientationLandscapeRight,
    DeviceOrientationLandscapeLeft
};

@interface VideoConfiguration : NSObject
/// 默认视频配置（默认前置摄像头,竖屏 CaptureSessionPreset640x480_Low（分辨率））
+ (instancetype)defaultConfiguration;
/// 视频配置
+ (instancetype)defaultConfigurationForQuality:(StreamingVideoSessionPreset)videoQuality withPosition:(CaptureDevicePosition)capturePosition withDevicePosition:(DevicePosition)devicePosition;
///< 分辨率
@property (nonatomic, assign) StreamingVideoSessionPreset sessionPreset;

///< 方向
@property (nonatomic, assign) CaptureDevicePosition capturePosition;

// 设备方向
@property (nonatomic, assign) DevicePosition devicePosition;

@end
