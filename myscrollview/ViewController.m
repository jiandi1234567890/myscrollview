//
//  ViewController.m
//  myscrollview
//
//  Created by 张海禄 on 16/5/6.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "ViewController.h"
#import "myview.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong) myview * mview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    
    NSArray *array=@[[UIImage imageNamed:@"banner1.jpg"],[UIImage imageNamed:@"banner2.jpg"],[UIImage imageNamed:@"banner3.jpg"],[UIImage imageNamed:@"pic_ad2.jpg"]];
    NSArray *array1=@[[UIImage imageNamed:@"banner1.jpg"]];
    NSArray *array2=@[[UIImage imageNamed:@"banner1.jpg"],[UIImage imageNamed:@"banner2.jpg"]];
   
    self.mview=[[myview alloc]initWithFrame:CGRectMake(0, 24, [UIScreen mainScreen].bounds.size.width,120 ) imageArray:array];
    [self.mview setPageColor:[UIColor whiteColor] andCurrentPageColor:[UIColor greenColor]];
    [self.mview settime:3];
    [self.view addSubview:self.mview];

    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
