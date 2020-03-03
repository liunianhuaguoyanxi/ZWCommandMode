//
//  ZWCommandManager.m
//  ZWCommandMode
//
//  Created by 流年划过颜夕 on 2020/3/3.
//  Copyright © 2020 liunianhuaguoyanxi. All rights reserved.
//

#import "ZWCommandManager.h"

@implementation ZWCommandManager
-(NSMutableArray<ZWCommand *> *)arrayCommands
{
    if (!_arrayCommands) {
        _arrayCommands = [NSMutableArray array];
    }
    return _arrayCommands;
}
+ (instancetype)shareInstance
{
    static ZWCommandManager  * commandManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        commandManager = [[ZWCommandManager alloc] init];
    });
    return commandManager;
}
//执行命令
+ (void)executeCommand:(ZWCommand *)command completion:(ZWCommandCompletionCallBack)completion
{
    if (command) {
        // 如果命令正在执行则不做处理，反之则添加并执行命令
        if (![self __isExecutingCommand:command]) {
            // 添加命令到命令容器中
            [[[self shareInstance] arrayCommands] addObject:command];
            NSLog(@"%@ 添加命令到命令容器中",[[self shareInstance] arrayCommands]);
            // 设置命令执行完成的回调
            command.completion = completion;
            // 执行命令
            [command execute];
        }
    }
}

//取消命令
+ (void)cancleCommand:(ZWCommand *)command
{
    
    if (command && [[[self shareInstance] arrayCommands] containsObject:command]) {
        
        // 取消命令执行
        [command cancel];
    }
}

+ (BOOL)__isExecutingCommand:(ZWCommand *)command
{
    if (command) {
        NSArray *commands = [[self shareInstance] arrayCommands] ;
        for (ZWCommand *tmpCommand in commands) {
            if (command == tmpCommand) {
                return YES;
            }
        }
    }
    return  NO;
}
@end
