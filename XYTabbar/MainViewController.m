//
//  MainViewController.m
//  XYTabbar
//
//  Created by 向阳 on 16/11/17.
//  Copyright © 2016年 xiangyang. All rights reserved.
//

#import "MainViewController.h"
#import "XYTabbar.h"

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()
{
    UIImageView *_selectImgView;
}

@property (nonatomic, assign) NSInteger selectedIndex;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建底部视图
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-49, kScreenWidth, 49)];
    bottomView.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.f];
    [self.view addSubview:bottomView];
    
    //2.创建选中下标
    _selectImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 47, kScreenWidth/4, 2)];
    _selectImgView.backgroundColor = [UIColor orangeColor];
    [bottomView addSubview:_selectImgView];
    
    //3.创建按钮
    NSArray *imgArray = @[@"ico_shouye_hui",
                          @"ico_dingwei_hui",
                          @"ico_xiaoxi_hui",
                          @"ico_gerenzhongxin_hui"];
    
    NSArray *titleArray = @[@"首页",@"附近",@"消息",@"个人中心"];
    
    CGFloat width = kScreenWidth/imgArray.count;
    for (int i=0; i<[imgArray count]; i++) {
        NSString *imgName = imgArray[i];
        NSString *title = titleArray[i];
        
        CGRect frame = CGRectMake(i*width, 0, width, 49);
        XYTabbar *item = [[XYTabbar alloc] initWithFrame:frame
                                                       imageName:imgName
                                                           title:title];
        item.tag = i;
        [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:item];
    }
}

- (void)clickItem:(XYTabbar *)item {
    
    self.selectedIndex = item.tag;
    
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = _selectImgView.frame;
        frame.origin.x = self.selectedIndex * kScreenWidth/4;
        _selectImgView.frame = frame;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
