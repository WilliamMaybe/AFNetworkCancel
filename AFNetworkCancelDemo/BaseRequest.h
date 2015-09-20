//
//  BaseRequest.h
//  AFNetworkCancelDemo
//
//  Created by WilliamZhang on 15/9/20.
//  Copyright © 2015年 WilliamZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseRequest : NSObject

- (void)requestDataFinishedComplection:(void(^)(id object)) complection;

@end
