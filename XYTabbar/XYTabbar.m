//
//  XYTabbar.m
//  XYTabbar
//
//  Created by 向阳 on 16/11/17.
//  Copyright © 2016年 xiangyang. All rights reserved.
//

#import "XYTabbar.h"

@implementation XYTabbar

- (id)initWithFrame:(CGRect)frame
          imageName:(NSString *)name
              title:(NSString *)title {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        //1.创建子视图
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-26)/2, 4, 26, 26)];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.image = [UIImage imageNamed:name];
        [self addSubview:imgView];
        
        //2.创建标题视图
        CGFloat maxY = CGRectGetMaxY(imgView.frame);
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, maxY, frame.size.width, 18)];
        titleLabel.text = title;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.font = [UIFont systemFontOfSize:11.0];
        [self addSubview:titleLabel];
        
    }
    
    return self;
}


@end
