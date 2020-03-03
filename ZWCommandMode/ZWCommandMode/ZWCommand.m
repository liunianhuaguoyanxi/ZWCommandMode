//
//  ZWCommand.m
//  ZWCommandMode
//
//  Created by 流年划过颜夕 on 2020/3/3.
//  Copyright © 2020 liunianhuaguoyanxi. All rights reserved.
//

#import "ZWCommand.h"
#import "ZWCommandManager.h"
@implementation ZWCommand
- (void)execute
{
    //override to subclass do something
    [self done];
}
- (void)cancel
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (_completion) {
            _completion(self,NO);
        }
        
        self.completion = nil;
        
        [[ZWCommandManager shareInstance].arrayCommands removeObject:self];
    });
}

- (void)done
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (_completion) {
            _completion(self,YES);
        }
        
        self.completion = nil;
        
        [[ZWCommandManager shareInstance].arrayCommands removeObject:self];
    });
}
@end
