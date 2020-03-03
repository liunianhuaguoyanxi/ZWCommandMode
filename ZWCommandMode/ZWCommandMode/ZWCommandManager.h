//
//  ZWCommandManager.h
//  ZWCommandMode
//
//  Created by 流年划过颜夕 on 2020/3/3.
//  Copyright © 2020 liunianhuaguoyanxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWCommand.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZWCommandManager : NSObject
/** 命令 */
@property (nonatomic, strong) ZWCommand *command;
/** 命令容器 */
@property (nonatomic, strong) NSMutableArray <ZWCommand *> *arrayCommands;


+ (instancetype)shareInstance;

//执行命令
+ (void)executeCommand:(ZWCommand *)command completion:(ZWCommandCompletionCallBack)completion;

//取消命令
+ (void)cancleCommand:(ZWCommand *)command;

@end

NS_ASSUME_NONNULL_END
