//
//  AvStreamerViewController.m
//  liveflvdemo
//
//  Created by EricTao on 16/6/10.
//  Copyright © 2016年 andy. All rights reserved.
//

#import "AvStreamerViewController.h"
#import "DyncLivePublisher.h"
#import "VideoConfiguration.h"
#import <Masonry.h>

@interface AvStreamerViewController ()<DyncLivePublisherDelegate>

@property (nonatomic, strong) UIButton *beautyButton;
@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *startLiveButton;

@property (nonatomic, strong) DyncLivePublisher *app;
@end


@implementation AvStreamerViewController
- (void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _app = [[DyncLivePublisher alloc] initWithVideoConfiguration:[VideoConfiguration defaultConfigurationForQuality:CaptureSessionPreset640x480_Hight withPosition:CaptureDevicePositionFront withDevicePosition:DeviceOrientationPortrait]];
    _app.delegate = self;
    [_app setPreview:self.view];
    
    [self.view addSubview:self.closeButton];
    [self.view addSubview:self.cameraButton];
    [self.view addSubview:self.beautyButton];
    [self.view addSubview:self.startLiveButton];
    __weak typeof(self)weakSelf = self;
    [_closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_right).offset(-20);
        make.top.equalTo(weakSelf.view.mas_top).offset(20);
        make.width.equalTo(@[@(44)]);
        make.height.equalTo(@[@(44)]);
    }];

    [_cameraButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.closeButton.mas_left).offset(-20);
        make.top.equalTo(weakSelf.view.mas_top).offset(20);
        make.width.equalTo(@[@(44)]);
        make.height.equalTo(@[@(44)]);
    }];
    
    [_beautyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.cameraButton.mas_left).offset(-20);
        make.top.equalTo(weakSelf.view.mas_top).offset(20);
        make.width.equalTo(@[@(44)]);
        make.height.equalTo(@[@(44)]);
    }];
    //rtmp://192.168.7.207:1935/live1/room
    //rtmp://192.168.199.130:1935/live1/room
    [_app startPublish:@"rtmp://192.168.7.207:1935/live1/room"];

}

- (void)closeButtonEvent:(UIButton*)sender {
    [_app stopPublish];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)cameraButtonEvent:(UIButton*)sender {
     self.cameraButton.selected = !self.cameraButton.selected;
    [self.app switchCamera:self.cameraButton.selected];
}
- (void)beautyButtonEvent:(UIButton*)sender {
    self.beautyButton.selected = !self.beautyButton.selected;
    [self.app setBeautyFace:self.beautyButton.selected];
    
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

- (UIButton*)cameraButton{
    if(!_cameraButton){
        _cameraButton = [UIButton new];
        [_cameraButton setImage:[UIImage imageNamed:@"camra_preview"] forState:UIControlStateNormal];
        _cameraButton.exclusiveTouch = YES;
         [_cameraButton addTarget:self action:@selector(cameraButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _cameraButton;
}

- (UIButton*)beautyButton{
    if(!_beautyButton){
        _beautyButton = [UIButton new];
        [_beautyButton setImage:[UIImage imageNamed:@"camra_beauty"] forState:UIControlStateSelected];
        [_beautyButton setImage:[UIImage imageNamed:@"camra_beauty_close"] forState:UIControlStateNormal];
        _beautyButton.exclusiveTouch = YES;
        [_beautyButton addTarget:self action:@selector(beautyButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
        _beautyButton.selected = YES;
     
    }
    return _beautyButton;
}

#pragma mark -  DyncLivePublisherDelegate
- (void)OnStreamOk {
    NSLog(@"OnStreamOk");
}

- (void)OnStreamReconnecting:(int)times {
    NSLog(@"OnStreamReconnecting:%d",times);
}

- (void)OnStreamFailed:(int)code {
     NSLog(@"OnStreamFailed:%d",code);
}

- (void)OnStreamClosed {
    NSLog(@"OnStreamClosed");
}

- (void)OnStreamStatus:(int)delayMs withNetBand:(int)netBand {
    NSLog(@"OnStreamStatus:%d withNetBand:%d",delayMs,netBand);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
