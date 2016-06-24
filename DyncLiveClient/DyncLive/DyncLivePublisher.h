//
//  DyncLivePublisher.h
//  liveflv
//
//  Created by jianqiangzhang on 16/6/23.
//  Copyright © 2016年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VideoConfiguration.h"
NS_ASSUME_NONNULL_BEGIN
@protocol DyncLivePublisherDelegate <NSObject>

- (void)OnStreamOk;

- (void)OnStreamReconnecting:(int)times;

- (void)OnStreamFailed:(int)code;

- (void)OnStreamClosed;

- (void)OnStreamStatus:(int)delayMs withNetBand:(int)netBand;

@end

@interface DyncLivePublisher : NSObject

@property (nonatomic, readonly) BOOL beautyFace;
@property (nonatomic, readonly) BOOL micEnable;
@property (nonatomic, readonly) BOOL camEnable;
@property (nonatomic, readonly) BOOL isFontCam; //默认YES

@property (nonatomic, weak) id<DyncLivePublisherDelegate> delegate;

/**
 *  初始化推流器
 *
 *  @param videoConfiguration 视频参数配置
 *
 *  @return 推流对象
 */
- (instancetype)initWithVideoConfiguration:(nullable VideoConfiguration *)videoConfiguration;

/**
 *  本地摄像头对象
 *
 *  @param preView 本地摄像头对象
 */
- (void)setPreview:(UIView*)preView;

/**
 *  推流地址设置
 *
 *  @param rtmpUrl 推流地址
 */
- (void)startPublish:(NSString*)rtmpUrl;

/**
 *  停止推流
 */
- (void)stopPublish;

/**
 *  转换摄像头
 *
 *  @param bUseBackCamera
 */
- (void)switchCamera:(BOOL)bUseBackCamera;

/**
 *  麦克风开关
 *
 *  @param micEnable 开/关
 */
- (void)setMicEnable:(BOOL)micEnable;

/**
 *  本地视频开关
 *
 *  @param camEnable 开/关
 */
- (void)setCamEnable:(BOOL)camEnable;

/**
 *  美颜
 *
 *  @param beautyFace 开/关
 */
- (void)setBeautyFace:(BOOL)beautyFace;

NS_ASSUME_NONNULL_END
@end
