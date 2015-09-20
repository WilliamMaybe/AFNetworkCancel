//
//  BaseRequest.m
//  AFNetworkCancelDemo
//
//  Created by WilliamZhang on 15/9/20.
//  Copyright © 2015年 WilliamZhang. All rights reserved.
//

#import "BaseRequest.h"
#import <AFNetworking/AFNetworking.h>

@interface BaseRequest ()

@property (nonatomic , strong) AFHTTPRequestOperation *operation;

@end

@implementation BaseRequest

- (void)requestDataFinishedComplection:(void(^)(id object)) complection {
    if (self.operation) {
        [self.operation cancel];
    }

//    使用暂停及恢复的方法
//    [self.operation pause];
//    [self.operation resume];
    
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
//    Canceling the operations does not automatically remove them from the queue or stop those that are currently executing.
//    所以下面的method实际上并没有停止网络请求
//    [[manager operationQueue] cancelAllOperations];
    
    AFHTTPRequestOperation *operation = [manager GET:@"http://157.7.84.207:6002" parameters:@"" success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (operation.isCancelled) {
            NSLog(@"operation is canceled");
        }
        else {
            if (complection) {
                complection(responseObject);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (operation.isCancelled) {
            return;
        }
            NSLog(@"operation failed");
    }];
    
    self.operation = operation;
}

@end
