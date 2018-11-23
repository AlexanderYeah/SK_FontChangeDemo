//
//  ViewController.m
//  SK_FontAdaptationDemo
//
//  Created by TrimbleZhang on 2018/11/23.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "ViewController.h"


// 第一种方式用宏定义适配字体
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define FONT_SIZE(size) ([UIFont systemFontOfSize:FontSize(size)])

static inline CGFloat FontSize(CGFloat fontSize){
    
    if (SCREEN_WIDTH == 320) {
        // 5s 小屏幕
        return fontSize - 10;
    }else if (SCREEN_WIDTH == 375){
        // 6s 4.7
        return fontSize ;
    }else{
        // plus x xmax  大屏
        return fontSize + 10;
    }
    
}


// 第二种方式用宏定义适配字体

#define IsIphone6P   SCREEN_WIDTH==414

#define SizeScale    (IsIphone6P ? 1.5 : 1)

#define kFontSize(value)  value*SizeScale

#define kFont(value)  [UIFont systemFontOfSize:value*SizeScale]




@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//  第一种方式宏定义修改字体
    UILabel *titleLbl = [[UILabel alloc]init];
    titleLbl.font = FONT_SIZE(15);
    titleLbl.frame = CGRectMake(100, 200, 200, 50);
    titleLbl.textAlignment = 1;
    titleLbl.textColor =  [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1];
    titleLbl.text = @"AlexanderYeah";
    titleLbl.userInteractionEnabled = YES;
    [self.view addSubview:titleLbl];
    

//  第二种方式宏定义修改字体
    UILabel *titleLbl2 = [[UILabel alloc]init];
    titleLbl2.font = FONT_SIZE(15);
    titleLbl2.frame = CGRectMake(100, 300, 200, 50);
    titleLbl2.textAlignment = 1;
    titleLbl2.textColor =  [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1];
    titleLbl2.text = @"handsome man";
    titleLbl2.userInteractionEnabled = YES;
    [self.view addSubview:titleLbl2];
    
// 第三种方式全局修改字体
    
    UILabel *titleLbl3 = [[UILabel alloc]init];
    titleLbl3.font = FONT_SIZE(15);
    titleLbl3.frame = CGRectMake(100, 400, 200, 50);
    titleLbl3.textAlignment = 1;
    titleLbl3.textColor =  [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1];
    titleLbl3.text = @"just do it";
    titleLbl3.userInteractionEnabled = YES;
    [self.view addSubview:titleLbl3];
        
    
}


@end
