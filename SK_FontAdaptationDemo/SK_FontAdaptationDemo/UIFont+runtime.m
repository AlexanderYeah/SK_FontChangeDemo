//
//  UIFont+runtime.m
//  SK_FontAdaptationDemo
//
//  Created by TrimbleZhang on 2018/11/23.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "UIFont+runtime.h"
#import <objc/runtime.h>

#define UIDesignScreen  375 // UI设计原型图的手机尺寸宽度(6), 6p的--414
@implementation UIFont (runtime)

+ (void)load
{
    // 新的适配字体的方法
    Method curMethod = class_getClassMethod([self class], @selector(adjustFont:));
    
    // 获取系统原来的设置字体的方法
    Method oldMethod = class_getClassMethod([self class], @selector(systemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(curMethod, oldMethod);
    

}

+ (UIFont *)adjustFont:(CGFloat)fontSize {
    UIFont *newFont = nil;

    newFont = [UIFont adjustFont:fontSize * [UIScreen mainScreen].bounds.size.width / UIDesignScreen];
    return newFont;
}

@end
