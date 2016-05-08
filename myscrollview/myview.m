//
//  myview.m
//  myscrollview
//
//  Created by 张海禄 on 16/5/6.
//  Copyright © 2016年 张海禄. All rights reserved.
//

#import "myview.h"
@interface myview()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,weak) UIImageView *currentImageView;   // 当前imageView
@property (nonatomic,weak) UIImageView *nextImageView;      // 下一个imageView
@property (nonatomic,weak) UIImageView *preImageView;       //上一个imageView
@property (nonatomic,strong)NSTimer *timer;                 //设置动画
@property(nonatomic,strong) NSArray * imageArray;
@property(nonatomic,strong) UIPageControl * pagecontrol;
@property(nonatomic) CGFloat time;
@end


@implementation myview



- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray{
    if (self = [super initWithFrame:frame]) {
        self.imageArray =imageArray;
        
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        
        self.scrollView=[[UIScrollView alloc] init];
        
        self.scrollView.frame = CGRectMake(0, 0, width, height);
        
        [self.scrollView setContentSize:CGSizeMake(width * 3, height)];
        //  设置隐藏横向条
        self.scrollView.showsHorizontalScrollIndicator = NO;
        //  设置自动分页
        self.scrollView.pagingEnabled = YES;
                //  设置代理
                self.scrollView.delegate = self;
        //  设置当前点
        self.scrollView.contentOffset = CGPointMake(width, 0);
        [self addSubview:self.scrollView];
        
        if(self.imageArray.count==1)
        {
            //  初始化当前视图
            UIImageView *currentImageView =[[UIImageView alloc] init];
            currentImageView.image = self.imageArray[0];
            [self.scrollView addSubview:currentImageView];
            self.currentImageView = currentImageView;
            self.currentImageView.frame = CGRectMake(width, 0, width, height);
            
            //  初始化下一个视图
            UIImageView *nextImageView = [[UIImageView alloc] init];
            nextImageView.image = self.imageArray[0];
            [self.scrollView addSubview:nextImageView];
            self.nextImageView = nextImageView;
            self.nextImageView.frame = CGRectMake(width * 2, 0, width, height);
            
            //  初始化上一个视图
            UIImageView *preImageView =[[UIImageView alloc] init];
            preImageView.image = self.imageArray[0];
            preImageView.frame = CGRectMake(0, 0, width, height);
            [self.scrollView addSubview:preImageView];
            self.preImageView = preImageView;

        
        
        }else if(self.imageArray.count==2){
            
            //  初始化当前视图
            UIImageView *currentImageView =[[UIImageView alloc] init];
            currentImageView.image = self.imageArray[1];
            [self.scrollView addSubview:currentImageView];
            self.currentImageView = currentImageView;
            self.currentImageView.frame = CGRectMake(width, 0, width, height);
            
            //  初始化下一个视图
            UIImageView *nextImageView = [[UIImageView alloc] init];
            nextImageView.image = self.imageArray[0];
            [self.scrollView addSubview:nextImageView];
            self.nextImageView = nextImageView;
            self.nextImageView.frame = CGRectMake(width * 2, 0, width, height);
            
            //  初始化上一个视图
            UIImageView *preImageView =[[UIImageView alloc] init];
            preImageView.image = self.imageArray[0];
            preImageView.frame = CGRectMake(0, 0, width, height);
            [self.scrollView addSubview:preImageView];
            self.preImageView = preImageView;

        }else if(self.imageArray.count>=3){
        
        //  初始化当前视图
        UIImageView *currentImageView =[[UIImageView alloc] init];
        currentImageView.image = self.imageArray[1];
        [self.scrollView addSubview:currentImageView];
        self.currentImageView = currentImageView;
        self.currentImageView.frame = CGRectMake(width, 0, width, height);
        
        //  初始化下一个视图
        UIImageView *nextImageView = [[UIImageView alloc] init];
        nextImageView.image = self.imageArray[2];
        [self.scrollView addSubview:nextImageView];
        self.nextImageView = nextImageView;
        self.nextImageView.frame = CGRectMake(width * 2, 0, width, height);
        
        //  初始化上一个视图
        UIImageView *preImageView =[[UIImageView alloc] init];
        preImageView.image = self.imageArray[0];
        preImageView.frame = CGRectMake(0, 0, width, height);
        [self.scrollView addSubview:preImageView];
            self.preImageView = preImageView;
        }
        else{
            //  初始化当前视图
            UIImageView *currentImageView =[[UIImageView alloc] init];
            currentImageView.image = [UIImage imageNamed:@"placeholder.png"];
            [self.scrollView addSubview:currentImageView];
            self.currentImageView = currentImageView;
            self.currentImageView.frame = CGRectMake(width, 0, width, height);
            
            //  初始化下一个视图
            UIImageView *nextImageView = [[UIImageView alloc] init];
            nextImageView.image = [UIImage imageNamed:@"placeholder.png"];
            [self.scrollView addSubview:nextImageView];
            self.nextImageView = nextImageView;
            self.nextImageView.frame = CGRectMake(width * 2, 0, width, height);
            
            //  初始化上一个视图
            UIImageView *preImageView =[[UIImageView alloc] init];
            preImageView.image = [UIImage imageNamed:@"placeholder.png"];
            preImageView.frame = CGRectMake(0, 0, width, height);
            [self.scrollView addSubview:preImageView];
            self.preImageView = preImageView;

            
        }
        
        [self setPageControlShow];
        [self starttimer];
        
    }
    return self;
    
}
+ (instancetype)myscrollviewWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray{
    return [[self alloc] initWithFrame:frame imageArray:imageArray];
    
}

//设置pagecontrol

- (void)setPageControlShow{
    
    self.pagecontrol=[[UIPageControl alloc]init];
    if(self.imageArray.count>=2){
        self.pagecontrol.numberOfPages=self.imageArray.count;
    }else{
        self.pagecontrol.numberOfPages=0;
    }
    
    self.pagecontrol.frame=CGRectMake(0, 0, 20*self.imageArray.count, 20);
    self.pagecontrol.center=CGPointMake(self.scrollView.frame.size.width/2,self.scrollView.frame.origin.y+ self.scrollView.frame.size.height-10);
    self.pagecontrol.pageIndicatorTintColor=[UIColor whiteColor];
    self.pagecontrol.currentPageIndicatorTintColor=[UIColor blueColor];
    
    self.pagecontrol.currentPage=0;
    self.pagecontrol.enabled=NO;
    [[self.scrollView superview] addSubview:self.pagecontrol];
    
    
    
}


//开启定时器
-(void)starttimer{
    
    if(self.imageArray.count<=1){
        return;
    }else{
      
        if(self.timer){[self stoptimer];}
        // 设置时钟动画 定时器
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.time<3?3:self.time target:self selector:@selector(update:) userInfo:nil repeats:YES];
        //  将定时器添加到主线程
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        
    }
    
}
//关闭定时器
-(void)stoptimer{
    [self.timer invalidate];
    self.timer = nil;
    
}

//设置定时器时间
-(void)settime:(CGFloat)time{
    
      self.time=time;
    [self starttimer];
}


//设置pagecontrol颜色
- (void)setPageColor:(UIColor *)color andCurrentPageColor:(UIColor *)currentColor {
    self.pagecontrol.pageIndicatorTintColor = color;
    //  设置当前页码指示器的颜色
    self.pagecontrol.currentPageIndicatorTintColor = currentColor;
}




//定时器动作
- (void)update:(NSTimer *)timer{
    //定时移动
    
    CGPoint offSet = self.scrollView.contentOffset;
    offSet.x +=offSet.x;
    [self.scrollView setContentOffset:offSet animated:YES];
    
    if (offSet.x >= self.scrollView.frame.size.width *self.imageArray.count) {
        offSet.x = self.scrollView.frame.size.width;
    }
    
}


#pragma mark - UIScrollViewDelegate
//手动滑动时删除timer
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stoptimer];
}

//重新启动timer
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [self starttimer];
}


// 开始拖动
- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    static int i =1; //   当前展示的是第几张图片
    float offset = self.scrollView.contentOffset.x;
    if(offset ==0)
    {
        i=(i-1)%self.imageArray.count;
        self.pagecontrol.currentPage=(self.pagecontrol.currentPage-1)%self.imageArray.count;
    }
    else if (offset == self.scrollView.bounds.size.width * 2)
    {
        i=(i+1)%self.imageArray.count;
        self.pagecontrol.currentPage=(self.pagecontrol.currentPage+1)%self.imageArray.count;
        
    }
    else
    {
        return;
    }
    
    if(i==0){
        i=(int)self.imageArray.count;
        self.pagecontrol.currentPage=i;
    }
    
    _preImageView.image=self.imageArray[(i-1)%self.imageArray.count];
    _currentImageView.image=self.imageArray[i%self.imageArray.count];
    _nextImageView.image=self.imageArray[(i+1)%self.imageArray.count];
    
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    
}











@end
