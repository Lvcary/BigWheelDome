//
//  WheelAnimateView.h
//  羽橙
//
//  Created by 刘康蕤 on 16/5/13.
//  Copyright (c) 2015年 tiansouce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PieChartView.h"
#import <AudioToolbox/AudioToolbox.h>

typedef void(^wheelBlock)(BOOL);

@interface WheelAnimateView : UIView<PieChartViewDelegate,PieChartViewDataSource>
{
    //背景
    UIImageView *backImagView;
    //转盘
    PieChartView *pieChartView;
    
    ///循环次数
    int count;
    
    ///没有转完的情况下退出大转盘
    BOOL noFinish;
    
    
    CFURLRef		soundFileURLRef;
    SystemSoundID	soundFileObject;
    
    ///开始播放次数
    int startCount;
    ///中间播放次数
    int mindelCount;
    ///结束播放次数
    int endCount;
    
}

///系统提示音
@property (readwrite)	CFURLRef		soundFileURLRef;
@property (readonly)	SystemSoundID	soundFileObject;

@property(nonatomic,retain)NSArray *prizeArray;

///旋转到某个位置
@property(nonatomic,assign)CGFloat valueFloat;

///动画前的角度
@property(nonatomic,assign)CGFloat angleBefore;

// 按钮初始化时的角度
@property (nonatomic, assign) CGFloat angle;


@property(nonatomic,copy)wheelBlock wBlook;

-(id)initWithFrame:(CGRect)frame;


- (void)stop;

-(void)setwhooleViewWithArray:(NSArray *)aPrizeArray;
-(void)startAnimateWithToValue:(CGFloat)valueFloat;
@end
