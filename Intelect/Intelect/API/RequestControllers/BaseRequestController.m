//
//  BaseRequestController.m
//  Intelect
//
//  Created by Narek Sedrakyan on 10/30/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//
#import "BaseRequestController.h"
#import <AFNetworking/AFNetworking.h>
#import <JSONModel/JSONModel.h>

#define API_BASE_URL  @"https://intelect-184208.appspot.com/api"

@implementation BaseRequestController

- (NSString *)absoluteUrlWithUri:(NSString *)uri {
    NSMutableString * absoluteUrl = [[NSMutableString alloc] initWithString:API_BASE_URL];
    [absoluteUrl appendString:uri];
    return absoluteUrl.copy;
}

- (NSString *)absoluteUriFromBaseUri:(NSString *)baseUri uri:(NSString *)uri {
    NSMutableString * absoluteUrl = [[NSMutableString alloc] initWithString:baseUri];
    [absoluteUrl appendString:uri];
    return absoluteUrl.copy;
}

- (void)getForUri:(NSString *)uri success:(SuccessBlock)success fail:(FailBlock)fail {
    NSString *url = [self absoluteUrlWithUri:uri];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error,((NSHTTPURLResponse *)task.response).statusCode);
    }];
}

- (void)postForUri:(NSString *)uri object:(JSONModel *)object success:(SuccessBlock)success fail:(FailBlock)fail {
    NSString *url = [self absoluteUrlWithUri:uri];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:[object toDictionary] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error,((NSHTTPURLResponse *)task.response).statusCode);
    }];
}

- (void)putForUri:(NSString *)uri object:(id)object success:(SuccessBlock)success fail:(FailBlock)fail {
    NSString *url = [self absoluteUrlWithUri:uri];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager PUT:url parameters:[object toDictionary] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         fail(error,((NSHTTPURLResponse *)task.response).statusCode);
    }];
}

- (void)deleteForUri:(NSString *)uri byID:(NSString *)ID success:(SuccessBlock)success fail:(FailBlock)fail {
    NSString *url = [self absoluteUrlWithUri:uri];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager DELETE:url parameters:@{@"id": ID} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error,((NSHTTPURLResponse *)task.response).statusCode);
    }];
}

@end
