//
//  FDCountdownButtonView.h
//  RaStarGame
//
//  Created by 朱运 on 2017/10/23.
//  Copyright © 2017年 zhuyun. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,NumberType){
    NumberTypePhone,
    NumberTypeEmail,
};
@protocol FDCountdownDelegate;
@interface FDCountdownButtonView : UIView
@property(nonatomic,strong)UILabel *wordsLabel;
@property(nonatomic,strong)UIButton *countdownButton;
@property(nonatomic,weak)id <FDCountdownDelegate>delegate;

-(instancetype)initWithFrame:(CGRect)frame;
//-(instancetype)init UNAVAILABLE_ATTRIBUTE;
-(instancetype)init __attribute__ ((unavailable("请用initWithFrame:进行初始化")));
/**
 重新初始化数据
 */
-(void)loadInitMessage;
/**
 验证码的类型

 @param type 类型
 */
-(void)sendNumberType:(NumberType)type;
/**
 可点击发送按钮
 */
-(void)ableSelectButton;
/**
 不可点击发送按钮
 */
-(void)unableSelectButton;
@end


@protocol FDCountdownDelegate<NSObject>
@optional
-(void)beginSendNumberAction:(FDCountdownButtonView *)countDownView;
@end

