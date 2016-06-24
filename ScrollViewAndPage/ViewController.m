//
//  ViewController.m
//  ScrollViewAndPage
//
//  Created by ZMY on 16/3/30.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIScrollView *scroll;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, 320, 300)];
    scroll.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:scroll];
    
    for (int i = 0; i<6; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320 * i, 0, 320, 300)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]];
        if (5==i) {
            imageView.image = [UIImage imageNamed:@"1.png"];
        }
        [scroll addSubview:imageView];
    }
    
    scroll.contentSize = CGSizeMake(320*6, 300);
    scroll.pagingEnabled = YES;
    scroll.delegate = self;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
}

- (void)run {
    static float a = 0;
    a++;
    if (scroll.contentOffset.x/320 == 5)
    {
        scroll.contentOffset = CGPointMake(0, 0);
        a=1;
    }
    [scroll setContentOffset:CGPointMake(a*320, 0) animated:YES];
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    //1 判断偏移量
//        if (scrollView.contentOffset.x == 320*5) {
//    
//            scrollView.contentOffset = CGPointMake(0, 0);
//        }
//  
//
//    
//}

@end
