//
//  ZWSendMsgCommand.m
//  ZWCommandMode
//
//  Created by 流年划过颜夕 on 2020/3/3.
//  Copyright © 2020 liunianhuaguoyanxi. All rights reserved.
//

#import "ZWSendMsgCommand.h"

@implementation ZWSendMsgCommand
- (void)execute
{
    for (int i = 0 ; i < 100; i++) {
        NSLog(@"发送第%d条信息 ",i);
    } 
    [super execute];
}
@end
