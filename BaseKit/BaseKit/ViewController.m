//
//  ViewController.m
//  BaseKit
//
//  Created by 陈昭燊 on 2017/1/7.
//  Copyright © 2017年 燊燊科技公司. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkingTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NetWorkingTools sendRequest:^(NetWorkingTools<RequestManager> * _Nullable manager) {
        manager.requestMethod(GET)
        .requestUrl(@"http://123.56.6.91:7390/earthshaker/user/v2/awardList.do?access_token=admin")
        .requestParameter(nil);
        [manager sendWithSuccess:^(NSData * _Nullable data) {
            NSLog(@"%@",data);
        } faile:^(NSError * _Nullable error) {
            NSLog(@"%@",error);
        }];
    }];
}
@end
