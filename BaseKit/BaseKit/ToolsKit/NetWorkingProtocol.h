//
//  NetWorkingProtocol.h
//  BaseKit
//
//  Created by 陈昭燊 on 2017/1/7.
//  Copyright © 2017年 燊燊科技公司. All rights reserved.
//

#ifndef NetWorkingProtocol_h
#define NetWorkingProtocol_h

typedef NS_ENUM(NSUInteger, HTTPMethod) {
    GET,
    POST
};

@protocol RequestPropertyProtocol <NSObject>
@required
@property (nonatomic, copy ,nonnull) NSString *UrlStr;
@property (nonatomic, assign) HTTPMethod method;
@property (nonatomic, copy,nonnull) NSDictionary *parameter;
@property (nonatomic, strong,nonnull) NSData *response;

@end

@protocol RequestManager <RequestPropertyProtocol>
typedef void (^ _Nonnull handleComplete)(NSData * _Nullable);
typedef void (^ _Nonnull faile)();
@required
- (instancetype _Nullable (^ _Nonnull)(NSString * _Nonnull))requestUrl;
- (instancetype _Nullable (^ _Nonnull)(HTTPMethod))requestMethod;
- (instancetype _Nullable (^ _Nonnull)(NSDictionary *_Nullable))requestParameter;
- (void)sendWithSuccess:(void (^_Nonnull)(NSData * _Nullable data))handleComplete faile:(void (^_Nonnull)(NSError * _Nullable error))faile;
+ (void)sendRequest:(void (^_Nullable)(id<RequestManager> _Nullable manager))block;

@end

#endif
