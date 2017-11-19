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

//#define API_BASE_URL  @"https://intelect-184208.appspot.com/api"
#define API_BASE_URL  @"http://192.168.0.101:8080/api"


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

- (AFHTTPSessionManager *)manager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    [serializer setStringEncoding:NSUTF8StringEncoding];
    
    manager.requestSerializer=serializer;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    return manager;
}

- (void)getForUri:(NSString *)uri success:(SuccessBlock)success fail:(FailBlock)fail {
    NSString *url = [self absoluteUrlWithUri:uri];
    [[self manager] GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* responseErrorMessage = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];

        fail(error,responseErrorMessage,((NSHTTPURLResponse *)task.response).statusCode);
    }];
}

- (void)postForUri:(NSString *)uri object:(JSONModel *)object success:(SuccessBlock)success fail:(FailBlock)fail {
    NSString *url = [self absoluteUrlWithUri:uri];
    [[self manager] POST:url parameters:[object toDictionary] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* responseErrorMessage = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        fail(error,responseErrorMessage,((NSHTTPURLResponse *)task.response).statusCode);
    }];
}

- (void)putForUri:(NSString *)uri object:(id)object success:(SuccessBlock)success fail:(FailBlock)fail {
    NSString *url = [self absoluteUrlWithUri:uri];
    [[self manager] PUT:url parameters:[object toDictionary] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* responseErrorMessage = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
         fail(error,responseErrorMessage,((NSHTTPURLResponse *)task.response).statusCode);
    }];
}

- (void)deleteForUri:(NSString *)uri byID:(NSString *)ID success:(SuccessBlock)success fail:(FailBlock)fail {
    NSString *url = [self absoluteUrlWithUri:uri];
    [[self manager] DELETE:url parameters:@{@"id": ID} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString* responseErrorMessage = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        fail(error,responseErrorMessage,((NSHTTPURLResponse *)task.response).statusCode);
    }];
}

@end
