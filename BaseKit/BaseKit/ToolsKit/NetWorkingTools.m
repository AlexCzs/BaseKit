//
//  NetWorkingTools.m
//  BaseKit
//
//  Created by 陈昭燊 on 2017/1/7.
//  Copyright © 2017年 燊燊科技公司. All rights reserved.
//

#import "NetWorkingTools.h"



@implementation NetWorkingTools
@synthesize UrlStr;
@synthesize method;
@synthesize parameter;
@synthesize response;
- (NetWorkingTools* _Nullable (^)(NSString * _Nonnull))requestUrl{
    return ^NetWorkingTools *(NSString *requestUrl){
        self.UrlStr = requestUrl;
        return self;
    };
}
- (NetWorkingTools*  _Nullable (^)(HTTPMethod))requestMethod{
    return ^NetWorkingTools *(HTTPMethod requestMethod){
        self.method = requestMethod;
        return self;
    };
}
- (NetWorkingTools*  _Nullable (^)(NSDictionary * _Nullable))requestParameter{
    return ^NetWorkingTools *(NSDictionary *requestParameter){
        self.parameter = requestParameter;
        return self;
    };
}
- (void)sendWithSuccess:(void (^)(NSData * _Nullable))handleComplete faile:(void (^)(NSError * _Nullable))faile{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.UrlStr] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    switch (self.method) {
        case GET:
        request.HTTPMethod = @"GET";
        break;
        case POST:
        request.HTTPMethod = @"POST";
        break;
        default:
        break;
    }
    
    [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            if (faile) {
                faile(error);
            }
        }else{
            if (handleComplete) {
                self.response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];;
                handleComplete(self.response);
            }
        }
    }].resume;
}

+ (void)sendRequest:(void (^)(NetWorkingTools<RequestManager> * _Nullable manager))block{
    NetWorkingTools *tools = [NetWorkingTools new];
    block(tools);
    
}



@end
