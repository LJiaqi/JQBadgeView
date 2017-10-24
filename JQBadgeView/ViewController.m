//
//  ViewController.m
//  newButton
//
//  Created by 李佳琪 on 2017/9/20.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Badge.h"
#import "UIColor+Hex.h"
@interface ViewController ()
@property (nonatomic ,strong) UIView *badgeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBadge];
}

- (void)addBadge{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    view.backgroundColor = [UIColor colorWithHex:0x333333];
//    view.badgeOffSet = CGPointMake(-9, 7);
//    view.badgeWidth = 40;
//    view.badgeTextColor = [UIColor blackColor];
//    view.badgeBackgroundColor = [UIColor whiteColor];
//    view.badgeFont = [UIFont systemFontOfSize:14];
    [view showBadgeWith:BadgeStyleNumber value:@(8)];
    self.badgeView = view;
    [self.view addSubview:view];
}

- (void)hide{
    [self.badgeView clearBadge];
}

- (void)show{
    [self.badgeView resumeBadge];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
