//
//  ViewController.m
//  ZWCommandMode
//
//  Created by 流年划过颜夕 on 2020/3/3.
//  Copyright © 2020 liunianhuaguoyanxi. All rights reserved.
//

#import "ViewController.h"
#import "ZWdownLoadCommad.h"
#import "ZWSendMsgCommand.h"
#import "ZWCommandManager.h"
@interface ViewController ()
/** <#注释#> */
@property (nonatomic, strong) ZWdownLoadCommad *downLoadCommad;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.downLoadCommad = [[ZWdownLoadCommad alloc] init];
    [ZWCommandManager executeCommand:self.downLoadCommad completion:^(ZWCommand * _Nonnull command, BOOL isSuccess) {
        if (isSuccess) {
            NSLog(@"发送完毕 %@",NSStringFromClass([ZWdownLoadCommad class]));
        }else
        {
            NSLog(@"取消发送 %@",NSStringFromClass([ZWdownLoadCommad class]));
        }

        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [ZWCommandManager cancleCommand:self.downLoadCommad];
    
    [ZWCommandManager executeCommand:[[ZWSendMsgCommand alloc] init] completion:^(ZWCommand * _Nonnull command, BOOL isSuccess) {

         NSLog(@"发送完毕 %@",NSStringFromClass([ZWSendMsgCommand class]));

    }];
}

@end
