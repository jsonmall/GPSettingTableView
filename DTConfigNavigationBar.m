//
//  DTConfigNavigationBar.m
//  DrivingTest
//
//  Created by 郭大侠 on 2018/6/7.
//  Copyright © 2018年 eclicks. All rights reserved.
//

#import "DTConfigNavigationBar.h"

@interface DTConfigNavigationBar ()
{
    UINavigationBar *_navBar;
    UIView *_topView;
    UILabel *_navTitleLabel;
    BPOnePixLineView *_lineView;
}
@end


@implementation DTConfigNavigationBar

- (instancetype)initWithFrame:(CGRect)frame withNavigationTile:(NSString *)title
{
    if (self =[super initWithFrame:frame]) {
        self.navigationTitle = title;
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
        BPOnePixLineView *line = [[BPOnePixLineView alloc] initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width, 1)];
        line.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
        line.lineColor = [UIColor clearColor];
        _lineView = line;
        [self addSubview:line];
        
        UINavigationItem * navItem = [[UINavigationItem alloc] initWithTitle:self.navigationTitle];
        [self pushNavigationItem:navItem animated:NO];
        
        UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 44)];
        titleLb.font = FONT_B(18);
        titleLb.text = self.navigationTitle;
        titleLb.textColor = [UIColor whiteColor];
        navItem.titleView = titleLb;
        _navTitleLabel = titleLb;
        
        UIBarButtonItem *backItem = [DTPubUtil barButtonItemWithCustomImage:[UIImage imageNamed:@"nav_back"] target:self action:@selector(backAction)];
        navItem.leftBarButtonItem = backItem;
        _leftItem = backItem;
    }
    return self;
}

- (void)backAction
{
    if (self.leftActionBlcok) {
        self.leftActionBlcok();
    }
}

- (void)setContentOffset:(CGFloat)offset
{
    if (offset <=0) { //透明
        [self showNaviBar: NO];
    } else if (offset > 0 && offset < self.maxHeight ) { //渐变
        CGFloat alpha = MIN(1,  offset/self.maxHeight);
//        self.alpha = alpha;
        if(alpha < 0.5)
        {
            [self showNaviBar:NO];
        }else{
            [self showNaviBar:YES];
        }
    }else{
        [self showNaviBar:YES];
    }

}

- (void)showNaviBar:(BOOL)show
{
    UIButton *backBtn = self.leftItem.customView;
    if (show) {
        _lineView.lineColor = [UIColor colorWithHexString:@"d9d9d9"];
        _navTitleLabel.textColor = [UIColor blackColor];
        [backBtn setImage:[UIImage imageNamed:@"nav_back_b"] forState:UIControlStateNormal];
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        
    }else{
        _lineView.lineColor = [UIColor clearColor];
        _navTitleLabel.textColor = [UIColor whiteColor];
        [backBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
}

@end
