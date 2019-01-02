//
//  ViewController.m
//  PodExampleDemo
//
//  Created by Jamesholy on 2018/12/29.
//  Copyright © 2018 Jamesholy. All rights reserved.
//

#import "ViewController.h"
#import "XKConsoleBoard.h"
#import "XKCrashRecord.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      [self.view becomeFirstResponder];
    // 异常捕捉
    [XKCrashRecord startRecord];
    [XKCrashRecord enableSimulaterOrDebug];
}

- (void)viewDidAppear:(BOOL)animated {
    // 显示崩溃记录
    [XKCrashRecord showCrashInfoWithMoreInfo:@"当前环境：测试 api：xxx"];

}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(nullable UIEvent *)event {
#if DEBUG
    if (UIEventSubtypeMotionShake ==motion) {
        [[XKConsoleBoard borad] show];
    }
#endif
}

- (IBAction)openConsole:(id)sender {
    [[XKConsoleBoard borad] show];
}


- (IBAction)log:(id)sender {
    NSLog(@"我是打印日志：123 343 aaa 安慰aw  wgeg ;;;...!!awdA阿瓦达安慰");
}

- (IBAction)crash:(id)sender {
    NSArray *arr= @[@"1"];
    arr[2];
}

@end
