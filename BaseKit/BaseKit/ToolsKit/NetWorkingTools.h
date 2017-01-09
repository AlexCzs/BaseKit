//
//  NetWorkingTools.h
//  BaseKit
//
//  Created by 陈昭燊 on 2017/1/7.
//  Copyright © 2017年 燊燊科技公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkingProtocol.h"



@interface NetWorkingTools : NSObject<RequestManager>
- (NetWorkingTools* _Nullable (^ _Nonnull)(NSString * _Nonnull))requestUrl;
- (NetWorkingTools* _Nullable (^ _Nonnull)(HTTPMethod))requestMethod;
- (NetWorkingTools* _Nullable (^ _Nonnull)(NSDictionary *_Nullable))requestParameter;
+(void)sendRequest:(void (^ _Nullable)(NetWorkingTools<RequestManager>* _Nullable manager))block;
@end
