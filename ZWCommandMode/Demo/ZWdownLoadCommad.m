//
//  ZWdownLoadCommad.m
//  ZWCommandMode
//
//  Created by 流年划过颜夕 on 2020/3/3.
//  Copyright © 2020 liunianhuaguoyanxi. All rights reserved.
//

#import "ZWdownLoadCommad.h"
@interface ZWdownLoadCommad()
@property (nonatomic, assign) BOOL  isFinish;

@end

@implementation ZWdownLoadCommad
- (void)execute
{
    dispatch_queue_t queue = dispatch_queue_create("sendque", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0 ; i < 10000; i++) {
        NSLog(@"下载第%d条任务",i);
            if (self.isFinish) {
                break;
            }
        
        }
        [super execute];
    });

}

- (void)cancel
{
    self.isFinish = YES;
    [super cancel];
}
@end
