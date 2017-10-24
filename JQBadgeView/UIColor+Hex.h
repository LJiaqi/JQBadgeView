//
//  UIColor+Hex.h
//  newButton
//
//  Created by 李佳琪 on 2017/9/20.
//  Copyright © 2017年 lijiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor*) colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

@end
