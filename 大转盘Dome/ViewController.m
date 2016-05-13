//
//  ViewController.m
//  大转盘Dome
//
//  Created by 刘康蕤 on 16/5/13.
//  Copyright © 2016年 刘康蕤. All rights reserved.
//

#import "ViewController.h"
#import "WheelAnimateView.h"


#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@property (nonatomic, strong) WheelAnimateView * wAniView;

@property (nonatomic,retain) UIButton *wheelBtn;    //转  btn

@property (nonatomic, strong) NSArray *prizeListArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.wAniView];
    [self.wAniView addSubview:self.wheelBtn];
    
}

- (WheelAnimateView *)wAniView {
    if (!_wAniView) {
        
        int sexWidth = 0;
        
        if (kScreenWidth > kScreenHeight - 65 - 160) {
            sexWidth = kScreenHeight - 65 - 160;
        }else
        {
            sexWidth = kScreenWidth;
        }
        
        ///转盘视图
        _wAniView = [[WheelAnimateView alloc] initWithFrame:CGRectMake(kScreenWidth/2 - sexWidth/2, 30, sexWidth, sexWidth)];
        [_wAniView setwhooleViewWithArray:self.prizeListArray];
        
        
        __weak ViewController *controller = self;
        _wAniView.wBlook = ^(BOOL abool)
        {
            //震动
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            controller.wheelBtn.enabled = YES;
        };
    }
    return _wAniView;
}

- (UIButton *)wheelBtn {
    if (!_wheelBtn) {
        _wheelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _wheelBtn.frame = CGRectMake(self.wAniView.frame.size.width/2 - 25, self.wAniView.frame.size.height/2 - 20, 50, 50);
        [_wheelBtn setImage:[UIImage imageNamed:@"zhuan_btn_pre"] forState:0];
        _wheelBtn.layer.masksToBounds = YES;
        _wheelBtn.layer.cornerRadius = 25;
        [_wheelBtn setTitleColor:[UIColor whiteColor] forState:0];
        [_wheelBtn addTarget:self action:@selector(wheelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _wheelBtn;
}

- (NSArray *)prizeListArray {
    if (!_prizeListArray) {
        NSDictionary * dic1 = [NSDictionary dictionaryWithObjectsAndKeys:@"苹果手机",@"prize_title", nil];
        NSDictionary * dic2 = [NSDictionary dictionaryWithObjectsAndKeys:@"苹果耳机",@"prize_title", nil];
        NSDictionary * dic3 = [NSDictionary dictionaryWithObjectsAndKeys:@"现金红包",@"prize_title", nil];
        NSDictionary * dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"10元优惠券",@"prize_title", nil];
        NSDictionary * dic5 = [NSDictionary dictionaryWithObjectsAndKeys:@"VR头盔",@"prize_title", nil];
        _prizeListArray = [NSArray arrayWithObjects:dic1,dic2,dic3,dic4,dic5, nil];
    }
    return _prizeListArray;
}

#pragma  mark btn点击方法
#pragma mark - 实现相应的响应者方法  转得方法
-(void)wheelBtnAction:(UIButton *)sender
{
    sender.enabled = NO;
    int num = arc4random()%(int)self.prizeListArray.count;
    [_wAniView startAnimateWithToValue:[self valueFloatByindex:num]];
}


-(CGFloat)valueFloatByindex:(int)index
{
    //    CGFloat valueF = 0.0;
    
    int count = (int)_prizeListArray.count;
    
    int count1 = (1.5 * M_PI - 2 * index * M_PI / count + M_PI / count) * 100000;
    int count2 = (1.5 * M_PI - 2 * index * M_PI / count - M_PI / count) * 100000;
    int r = arc4random() % (count1 - count2 + 1) + count2;
    
    double val = r/100000.000000;
    return val;
}


@end
