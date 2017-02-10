//
//  NSUserDefaults+LD.h
//  ledao
//
//  Created by liu on 2017/1/5.
//  Copyright © 2017年 bianlike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (LD)

+ (void)ld_setDeviceToken:(NSString *)deviceToken;

+ (NSString *)ld_deviceToken;

+ (void)ld_saveAccessToken:(NSString *)accessToken;

+ (NSString *)ld_accessToken;

@end
