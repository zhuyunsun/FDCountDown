//
//  ViewController.m
//  FDCountDown
//
//  Created by 朱运 on 2019/2/10.
//  Copyright © 2019 朱运. All rights reserved.
//

#import "ViewController.h"
#import "FDCountdownButtonView.h"
@interface ViewController ()<FDCountdownDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FDCountdownButtonView *countDown = [[FDCountdownButtonView alloc]initWithFrame:CGRectMake(50, 100, 100, 50)];
    [countDown ableSelectButton];
    countDown.delegate = self;
    [self.view addSubview:countDown];
        
    
}
#pragma delegate
-(void)beginSendNumberAction:(FDCountdownButtonView *)countDownView{
    NSLog(@"开始倒数");
}

@end
