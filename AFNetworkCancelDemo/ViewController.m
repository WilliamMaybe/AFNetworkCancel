//
//  ViewController.m
//  AFNetworkCancelDemo
//
//  Created by WilliamZhang on 15/9/20.
//  Copyright © 2015年 WilliamZhang. All rights reserved.
//

#import "ViewController.h"
#import "BaseRequest.h"

@interface ViewController ()

@property (nonatomic , strong) BaseRequest *request;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.request = [BaseRequest new];
    for (int i = 0 ; i < 10; i ++) {
        [self requestDataWithCount:i];
        
        // 会直接取消之前的请求
        [self.request requestDataFinishedComplection:^(id object) {
            NSLog(@"finish download %d", i);
        }];
    }
}

- (void)requestDataWithCount:(int)i {

    BaseRequest *request = [[BaseRequest alloc] init];
    [request requestDataFinishedComplection:^(id object) {
        NSLog(@"finish download %d", i);
    }];
}

@end
