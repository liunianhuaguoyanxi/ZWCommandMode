//
//  ZWCommand.h
//  ZWCommandMode
//
//  Created by 流年划过颜夕 on 2020/3/3.
//  Copyright © 2020 liunianhuaguoyanxi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class ZWCommand;
typedef void (^ZWCommandCompletionCallBack)(ZWCommand *command ,BOOL isSuccess);
@interface ZWCommand : NSObject
/** <#注释#> */
@property (nonatomic, copy) ZWCommandCompletionCallBack completion;

- (void)execute;
- (void)cancel;

- (void)done;
@end

NS_ASSUME_NONNULL_END
