//
//  DTSetTableViewHeaderFootView.m
//  DrivingTest
//
//  Created by 郭大侠 on 2018/6/13.
//  Copyright © 2018年 eclicks. All rights reserved.
//

#import "DTSetTableViewHeaderFootView.h"

@implementation DTSetTableViewHeaderFootView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        _leftTitleLabel = [UILabel labelWithFrame:CGRectZero font:FONT(16) color:[UIColor colorWithString:@"000000"]];
        [self.contentView addSubview:_leftTitleLabel];
        [_leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 12, 10, 12));
        }];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       
    }
    return self;
}

@end
