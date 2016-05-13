//
//  PieChartView.h
//  大转盘Dome
//
//  Created by 刘康蕤 on 16/5/13.
//  Copyright © 2016年 刘康蕤. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PieChartViewDelegate;
@protocol PieChartViewDataSource;

@interface PieChartView : UIView

@property (nonatomic, assign) id <PieChartViewDataSource> datasource;
@property (nonatomic, assign) id <PieChartViewDelegate> delegate;

-(void)reloadData;

@end

@protocol PieChartViewDelegate <NSObject>

- (CGFloat)centerCircleRadius;

@end

@protocol PieChartViewDataSource <NSObject>

@required
- (int)numberOfSlicesInPieChartView:(PieChartView *)pieChartView;
- (double)pieChartView:(PieChartView *)pieChartView valueForSliceAtIndex:(NSUInteger)index;
- (UIColor *)pieChartView:(PieChartView *)pieChartView colorForSliceAtIndex:(NSUInteger)index;

@optional
- (NSString*)pieChartView:(PieChartView *)pieChartView titleForSliceAtIndex:(NSUInteger)index;

@end
