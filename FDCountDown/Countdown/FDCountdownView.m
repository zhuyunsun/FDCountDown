//
//  FDCountdownButtonView.m
//  RaStarGame
//
//  Created by 朱运 on 2017/10/23.
//  Copyright © 2017年 zhuyun. All rights reserved.
//

#import "FDCountdownView.h"
#define RGBcolor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface FDCountdownView ()
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)NSUInteger count;

@property(nonatomic,assign)NumberType  sendType;
@end
@implementation FDCountdownView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.count = 0;
        
        self.wordsLabel = [[UILabel alloc]init];
        self.wordsLabel.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.wordsLabel.font = [UIFont systemFontOfSize:13];
        self.wordsLabel.adjustsFontSizeToFitWidth = YES;
        self.wordsLabel.textAlignment = NSTextAlignmentCenter;
        self.wordsLabel.text = @"获取验证码";
        self.wordsLabel.textColor = RGBcolor(153, 153, 153, 1);
        [self addSubview:self.wordsLabel];
        
        self.countdownButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.countdownButton.frame = self.wordsLabel.frame;
        self.countdownButton.enabled = NO;
        [self.countdownButton addTarget:self action:@selector(countdownButtonAcction:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:self.countdownButton];
        
        self.layer.cornerRadius = 8;
        self.layer.borderColor = [[UIColor blackColor] CGColor];
        self.layer.borderWidth = 0.66;
    }
    return self;
}
-(void)countdownButtonAcction:(UIButton*)sender{
    if (sender.isEnabled) {
        [self closeKeyWindow];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(secoundAction) userInfo:nil repeats:YES];
        //在UISrollewView滚动时候,NSTimer会失效的问题
    /*NSTimer默认添加到runloop中,模式是NSDefaultRunLoopMode;如果是主线程中,当scrollewView进行拖动事件的时候,模式会变成NSEventTrackingRunLoopMode,NSDefaultRunLoopMode模式注册事件就不会执行,这个时候把NSTimer模式设置为NSRunLoopCommonModes,相当于2个模式的结合,就不要干扰到NSTimer的执行*/
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];//mode 设置为通用
        sender.enabled = NO;
        self.wordsLabel.textColor = RGBcolor(49, 166, 210, 1);//153
        
        //
        if (self.sendType == NumberTypePhone) {
            
        }
        if (self.sendType == NumberTypeEmail) {
            
        }
        [self.delegate beginSendNumberAction:self];
        
        
    }else{
        
    }
}
-(void)secoundAction{
    self.count ++;
    if (self.count == 60) {
        self.countdownButton.enabled = YES;
        self.wordsLabel.text = @"重新获取";
        self.count = 0;
        [self.timer invalidate];
         self.timer = nil;
    }else{
        self.wordsLabel.text = [NSString stringWithFormat:@"%lus",60 - self.count];
    }
}
-(void)loadInitMessage{
    self.wordsLabel.text = @"获取验证码";
    self.wordsLabel.textColor = RGBcolor(153, 153, 153, 1);
    self.countdownButton.enabled = NO;
    self.count = 0;
    [self.timer invalidate];
    self.timer = nil;
}
-(void)sendNumberType:(NumberType)type{
    self.sendType = type;
}
-(void)ableSelectButton{
    self.wordsLabel.textColor = RGBcolor(102, 102, 102, 1);
    self.countdownButton.enabled = YES;
}
-(void)unableSelectButton{
    self.wordsLabel.textColor = RGBcolor(153, 153, 153, 1);
    self.countdownButton.enabled = NO;
}
-(void)closeKeyWindow{
    [[UIApplication sharedApplication]sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}
@end
