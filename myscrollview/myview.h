//
//  myview.h
//  myscrollview
//
//  Created by 张海禄 on 16/5/6.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myview : UIView
//imageArray最好大于3张这样才能手动切换，小于3张得只能自动切换
- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray;
+ (instancetype)myscrollviewWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray;
//设置pagecontroll颜色
- (void)setPageColor:(UIColor *)color andCurrentPageColor:(UIColor *)currentColor;


@end
