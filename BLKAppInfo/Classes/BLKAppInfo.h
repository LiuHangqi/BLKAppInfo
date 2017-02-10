//
//  LDAppInfo.h
//  ledao
//
//  Created by liu on 2016/12/28.
//  Copyright © 2016年 bianlike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BLKAppInfo : NSObject

+ (instancetype)sharedInstance;

- (NSString *)NetworkModel;

- (NSString *)AppVersion;

- (NSString *)AppName;

- (NSString *)OSVersion;

- (NSString *)Language;

- (NSString *)DeviceModel;

- (NSString *)CountryCode;

- (NSString *)CarrierName;

- (NSString *)UDID;

- (void)removeUDID;

- (void)saveDeviceToken:(NSString *)deviceToken;

- (NSString *)DeviceToken;

- (void)saveAccessToken:(NSString *)accessToken;

- (NSString *)accessToken;


@end
