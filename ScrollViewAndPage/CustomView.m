//
//  CustomView.m
//  ScrollViewAndPage
//
//  Created by Mac on 16/6/18.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "CustomView.h"
#define SCROLLVIEWWIDTH  self.view.frame.size.width


@implementation CustomView

-(void)createAnnimatonWithScrollerView:(UIScrollView *)scrollerView  andDataArray:(NSMutableArray *)dataArray{
   
    
    for (int i = 0; i<dataArray.count; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(scrollerView.frame.size.width * i, 0, 320, 300)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]];
        
        if (dataArray.count==i) {
            imageView.image = [UIImage imageNamed:@"1.png"];
        }
        [scrollerView addSubview:imageView];
    }
    
    scrollerView.contentSize = CGSizeMake(scrollerView.frame.size.width*6, 0);
    scrollerView.pagingEnabled = YES;
    scrollerView.delegate = self;
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(run) userInfo:nil repeats:YES];
    

}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
