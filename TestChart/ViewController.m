//
//  ViewController.m
//  TestChart
//
//  Created by Bizapper VM MacOS  on 15/11/27.
//  Copyright (c) 2015年 Bizapper VM MacOS. All rights reserved.
//

#import "ViewController.h"
#import "UUChart.h"

@interface ViewController ()<UUChartDataSource>
{
    UUChart *chartView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    chartView = [[UUChart alloc]initwithUUChartDataFrame:CGRectMake(0, 100, 320, self.view.frame.size.height - 200) withSource:self withStyle:UUChartBarStyle];
    [chartView showInView:self.view];

    
}
- (NSArray *)getXTitles:(int)num
{
    NSMutableArray *xTitles = [NSMutableArray array];
    for (int i=0; i<num; i++) {
        NSString * str = [NSString stringWithFormat:@"R-%d月",i+1];
        [xTitles addObject:str];
    }
    return xTitles;
}

#pragma mark - @required
//横坐标标题数组
- (NSArray *)UUChart_xLableArray:(UUChart *)chart
{
    return [self getXTitles:6];
}
//数值多重数组
- (NSArray *)UUChart_yValueArray:(UUChart *)chart
{
    NSArray *ary1 = @[@"2",@"54",@"15",@"30",@"42",@"77"];
    NSArray *ary2 = @[@"76",@"34",@"54",@"23",@"16",@"99"];

    return @[ary1,ary2];
}

#pragma mark - @optional
//颜色数组
- (NSArray *)UUChart_ColorArray:(UUChart *)chart
{
    return @[UUGreen,UURed,UUBrown];
}
//显示数值范围
- (CGRange)UUChartChooseRangeInLineChart:(UUChart *)chart
{
    return CGRangeMake(100, 0);
}

#pragma mark 折线图专享功能

//标记数值区域
- (CGRange)UUChartMarkRangeInLineChart:(UUChart *)chart
{
//        return CGRangeMake(0, 100);
    return CGRangeZero;
}

//判断显示横线条
- (BOOL)UUChart:(UUChart *)chart ShowHorizonLineAtIndex:(NSInteger)index
{
    return YES;
}

//判断显示最大最小值
- (BOOL)UUChart:(UUChart *)chart ShowMaxMinAtIndex:(NSInteger)index
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
