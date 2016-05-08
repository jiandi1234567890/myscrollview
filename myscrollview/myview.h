//
//  myview.h
//  myscrollview
//
//  Created by 张海禄 on 16/5/6.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myview;

//图片切换的方向
typedef enum {
    ChangeModeleft,  //轮播向左
    ChangeModeright      //轮播向右
} ChangeMode;



@interface myview : UIView
/**
 *  设置图片切换的方向，默认为向左
 */
@property(nonatomic,assign)  ChangeMode ChangeMode;

//imageArray最好大于3张这样才能手动切换，小于3张得只能自动切换
- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray;
+ (instancetype)myscrollviewWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray;


//设置pagecontroll颜色
- (void)setPageColor:(UIColor *)color andCurrentPageColor:(UIColor *)currentColor;

//设定定时时间,默认2秒
-(void)settime:(CGFloat) time;
@end
