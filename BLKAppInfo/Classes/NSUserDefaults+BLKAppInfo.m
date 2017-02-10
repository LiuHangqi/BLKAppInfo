//
//  NSUserDefaults+LD.m
//  ledao
//
//  Created by liu on 2017/1/5.
//  Copyright © 2017年 bianlike. All rights reserved.
//

#import "NSUserDefaults+BLKAppInfo.h"

#define SUD [self standardUserDefaults]
#define SYNC_SUD [[self standardUserDefaults] synchronize]

static NSString *const kDeviceToken = @"kDeviceToken";
static NSString *const kAccessToken = @"kAccessToken";

@implementation NSUserDefaults (LD)

+ (void)ld_setDeviceToken:(NSString *)deviceToken {
 
    [SUD setObject:deviceToken forKey:kDeviceToken];
    SYNC_SUD;
}

+ (NSString *)ld_deviceToken {
    
    return [SUD objectForKey:kDeviceToken];
}

+ (void)ld_saveAccessToken:(NSString *)accessToken {
    
    [SUD setObject:accessToken forKey:kAccessToken];
    SYNC_SUD;
}

+ (NSString *)ld_accessToken {
    
    return [SUD objectForKey:kAccessToken];
}


@end
