//
//  UIView+Badge.m
//  newButton
//
//  Created by 李佳琪 on 2017/9/20.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

#import "UIView+Badge.h"
#import <objc/runtime.h>
#import "UIColor+Hex.h"

@implementation UIView (Badge)

static NSString * const badgeKey;
static NSString * const badgeTextColorKey;
static NSString * const badgeBackgroundColorKey;
static NSString * const badgeFontKey;
static NSString * const badgeWidthKey;
static NSString * const badgeOffsetKey;

static int maxCount = 99;

- (void) showBadgeWith:(BadgeStyle)style value:(NSNumber *)value{
    
    if (!self.badge) {
        self.badge = [self createLabel];
        [self addSubview:self.badge];
        [self bringSubviewToFront:self.badge];
    }
    
    if (style == BadgeStyleNumber) {
        [self showNumberBadge:value];
    }else{
        [self showRedDot];
    }
}

- (void)showRedDot{
    CGFloat width = self.badgeWidth?:5;
    CGRect frame = CGRectMake(self.bounds.size.width - width + self.badgeOffSet.x, self.badgeOffSet.y, width, width);
    self.badge.frame = frame;
    self.badge.text = @"";
    self.badge.layer.cornerRadius = width / 2.0;
    self.badge.layer.masksToBounds = YES;
    self.badge.hidden = NO;
}

- (void) showNumberBadge:(NSNumber *)value{
    if (value.integerValue <= 0) {
        self.badge.hidden = YES;
        return;
    }
    
    NSString *text = [NSString stringWithFormat:@"%ld",(long)value.integerValue];
    if (value.integerValue > maxCount) {
        text = [NSString stringWithFormat:@"%d+",maxCount];
    }
    self.badge.text = text;
    
    CGFloat width = self.badgeWidth?:15;
    CGFloat height = width;
    if (text.length >2) {
        width += 3;
    }
    CGRect frame = CGRectMake(self.bounds.size.width - width + self.badgeOffSet.x, self.badgeOffSet.y, width, height);
    self.badge.frame = frame;
    
    self.badge.layer.cornerRadius = width / 2.0;
    self.badge.layer.masksToBounds = YES;
    self.badge.hidden = NO;
}

- (void)clearBadge{
    self.badge.hidden = YES;
}

- (void)resumeBadge{
    if (self.badge.hidden) {
        self.badge.hidden = NO;
    }
}

- (UILabel *)createLabel{
    UILabel *badge = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"";
        label.backgroundColor = self.badgeBackgroundColor?self.badgeBackgroundColor:[UIColor colorWithHex:0xe60044];
        UIFont *font = self.badgeFont?self.badgeFont:[UIFont systemFontOfSize:8];
        [label setFont:font];
        label.textColor = self.badgeTextColor?self.badgeTextColor:[UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label;
    });
    return badge;
}

- (void)setBadge:(UILabel *)badge{
    objc_setAssociatedObject(self, &badgeKey, badge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)badge{
    return objc_getAssociatedObject(self, &badgeKey);
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor{
    objc_setAssociatedObject(self, &badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)badgeTextColor{
    return objc_getAssociatedObject(self, &badgeTextColorKey);
}

- (void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor{
    
    objc_setAssociatedObject(self, &badgeBackgroundColorKey, badgeBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)badgeBackgroundColor{
    return objc_getAssociatedObject(self, &badgeBackgroundColorKey);
}

- (void)setBadgeFont:(UIFont *)badgeFont{
    objc_setAssociatedObject(self, &badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIFont *)badgeFont{
    return objc_getAssociatedObject(self, &badgeFontKey);
}

- (void)setBadgeWidth:(CGFloat)badgeWidth{
     NSNumber *num = [NSNumber numberWithFloat:badgeWidth];
    objc_setAssociatedObject(self, &badgeWidthKey, num, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)badgeWidth{
    NSNumber *num = objc_getAssociatedObject(self, &badgeWidthKey);
    return num.floatValue;
}

- (void)setBadgeOffSet:(CGPoint)badgeOffSet{
    
    NSNumber *offsetX = [NSNumber numberWithFloat:badgeOffSet.x] ?: @(0);
    NSNumber *offsetY = [NSNumber numberWithFloat:badgeOffSet.y] ?: @(0);
    NSDictionary *dic = @{
                          @"x":offsetX,
                          @"y":offsetY
                          };
    objc_setAssociatedObject(self, &badgeOffsetKey, dic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGPoint)badgeOffSet{
    NSDictionary *dic = objc_getAssociatedObject(self, &badgeOffsetKey);
    if (!dic) {
        return CGPointZero;
    }
    NSNumber *offsetX = [dic objectForKey:@"x"]?:@(0);
    NSNumber *offsetY = [dic objectForKey:@"y"]?:@(0);
    CGPoint point = CGPointMake(offsetX.floatValue, offsetY.floatValue);
    return point;
}
@end
