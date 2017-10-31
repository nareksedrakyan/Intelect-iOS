//
//  BaseRequestController.h
//  Intelect
//
//  Created by Narek Sedrakyan on 10/30/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//



#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RequestControllerStatus) {
    RequestControllerStatusCompleted = 1,
    RequestControllerStatusFailed,
    RequestControllerStatusInProgress,
};
typedef void(^SuccessBlock)(id response);
typedef void(^FailBlock)(NSError *error, NSUInteger statusCode);

@interface BaseRequestController : NSObject

@property (nonatomic) RequestControllerStatus status;

- (NSString *)absoluteUriFromBaseUri:(NSString *)baseUri uri:(NSString *)uri;

- (void)getForUri:(NSString *)uri success:(SuccessBlock)success fail:(FailBlock)fail;
- (void)postForUri:(NSString *)uri object:(id)object success:(SuccessBlock)success fail:(FailBlock)fail;
- (void)putForUri:(NSString *)uri object:(id)object success:(SuccessBlock)success fail:(FailBlock)fail;
- (void)deleteForUri:(NSString *)uri byID:(NSString *)ID success:(SuccessBlock)success fail:(FailBlock)fail;

@end
