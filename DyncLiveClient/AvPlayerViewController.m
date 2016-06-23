//
//  AvPlayerViewController.m
//  liveflvdemo
//
//  Created by EricTao on 16/6/10.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "AvPlayerViewController.h"
#import "DyncLivePlayer.h"
#import <Masonry.h>

@interface AvPlayerViewController () <DyncLivePlayerDelegate>

@property (nonatomic, strong) UIButton *closeButton;

@property (nonatomic, strong) DyncLivePlayer *avplayer;
@end

@implementation AvPlayerViewController
- (void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _avplayer = [[DyncLivePlayer alloc] initWithDelegate:self];
    _avplayer.videoContentMode = VideoShowModeScaleAspectFill;

    [_avplayer play:@"rtmp://192.168.199.131:1935/live1/room" withPlayerView:self.view];
    
    [self.view addSubview:self.closeButton];
    __weak typeof(self)weakSelf = self;
    [_closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_right).offset(-20);
        make.top.equalTo(weakSelf.view.mas_top).offset(20);
        make.width.equalTo(@[@(44)]);
        make.height.equalTo(@[@(44)]);
    }];
    
    
}
- (void)closeButtonEvent:(UIButton*)sender {
    [self.avplayer stop];
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (UIButton*)closeButton{
    
    if(!_closeButton){
        _closeButton = [UIButton new];
        [_closeButton addTarget:self action:@selector(closeButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
         _closeButton.exclusiveTouch = YES;
        [_closeButton setImage:[UIImage imageNamed:@"close_preview"] forState:UIControlStateNormal];
       
    }
    return _closeButton;
}

#pragma mark - IAvPlayerDelegate
- (void) onRtmpPlayerOK
{
    
}

- (void) onRtmpPlayerStatus:(int)cacheTime withBitrate:(int)curBitrate
{
    
}

- (void) onRtmpPlayerCache:(int)time
{
    
}

- (void) onRtmpPlayerClose:(int)errcode
{
    
}

@end
