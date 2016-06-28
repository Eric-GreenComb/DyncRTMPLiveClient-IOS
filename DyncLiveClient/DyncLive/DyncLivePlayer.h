//
//  DyncLivePlayer.h
//  liveflv
//
//  Created by jianqiangzhang on 16/6/23.
//  Copyright © 2016年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,VideoShowMode){
    VideoShowModeScaleAspectFit,
    VideoShowModeScaleAspectFill,
    VideoShowModeCenter
};
@protocol DyncLivePlayerDelegate <NSObject>
/**
 *  播放开始
 */
- (void)onRtmpPlayerOK;

- (void)onRtmpPlayerStatus:(int)cacheTime withBitrate:(int)curBitrate;

- (void)onRtmpPlayerCache:(int)time;

- (void)onRtmpPlayerClose:(int)errcode;
@end

@interface DyncLivePlayer : NSObject
@property (nonatomic, assign)VideoShowMode videoContentMode;

/**
 *  初始化播放器
 *
 *  @param delegate 回调
 *
 *  @return 播放器
 */
- (instancetype)initWithDelegate:(id<DyncLivePlayerDelegate>)delegate;

/**
 *  播放地址
 *
 *  @param nsUrl     地址
 *  @param superView 本地显示区域
 *
 *  @return 成功与否    
 */
- (BOOL)play:(NSString*) nsUrl withPlayerView:(UIView*) superView;

/**
 *  停止播放
 */
- (void)stop;

/**
 *  改变播放的方向
 */
- (void)changePlayerOrientation;

@end
