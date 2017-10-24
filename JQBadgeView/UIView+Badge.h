//
//  UIView+Badge.h
//  newButton
//
//  Created by 李佳琪 on 2017/9/20.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BadgeStyleRedDot = 0,
    BadgeStyleNumber = 1,
} BadgeStyle;


@interface UIView (Badge)

@property (nonatomic, strong) UILabel *badge;
@property (nonatomic, strong) UIColor *badgeTextColor;
@property (nonatomic, strong) UIColor *badgeBackgroundColor;
@property (nonatomic, strong) UIFont *badgeFont;
@property (nonatomic, assign) CGFloat badgeWidth;
@property (nonatomic, assign) CGPoint badgeOffSet;

- (void)showBadgeWith:(BadgeStyle)style value:(NSNumber *)value;
- (void)clearBadge;
- (void)resumeBadge;
@end
