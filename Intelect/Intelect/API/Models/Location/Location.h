//
//  Location.h
//  Intelect
//
//  Created by Narek Sedrakyan on 10/31/17.
//  Copyright © 2017 Narek Sedrakyan. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import <UIKit/UIKit.h>

@interface Location : JSONModel

@property (nonatomic) CGFloat latitude;
@property (nonatomic) CGFloat longitude;
@property (nonatomic) NSString *country;
@property (nonatomic) NSString *countryCode;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *zipcode;

@end
