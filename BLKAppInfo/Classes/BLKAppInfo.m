//
//  LDAppInfo.m
//  ledao
//
//  Created by liu on 2016/12/28.
//  Copyright © 2016年 bianlike. All rights reserved.
//

#import "BLKAppInfo.h"
#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import "SSKeychain.h"
#import "OpenUDID.h"
#import "AFNetworking.h"
#import "NSUserDefaults+BLKAppInfo.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

static NSString *const service = @"com.blkee.ledao";
static NSString *const account = @"ledao.udid";
static NSString *networkModel = nil;

@implementation BLKAppInfo

+ (instancetype)sharedInstance {
    
    static BLKAppInfo *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        shared = [[BLKAppInfo alloc]init];
    });
    
    return shared;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            
            switch (status) {
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    networkModel = @"WiFi";
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    networkModel = @"CellNetwork";
                    break;
                default:
                    networkModel = nil; 
                    break;
            }
        }];
        [manager startMonitoring];
    }
    return self;
}

- (NSString *)NetworkModel {
    
    return networkModel;
}

- (NSString *)AppVersion {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

- (NSString *)AppName {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
}

- (NSString *)OSVersion {
    
    return [UIDevice currentDevice].systemVersion;
}

- (NSString *)Language {
    
    return [[NSLocale preferredLanguages] objectAtIndex:0];
}

- (NSString *)DeviceModel {
    
    NSString *deviceModel;
    struct utsname systemInfo;
    uname(&systemInfo);
    deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceModel;
}

- (NSString *)CountryCode {
    
    NSLocale *local = [NSLocale currentLocale];
    return [local objectForKey:NSLocaleCountryCode];
}

- (NSString *)CarrierName {

    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc]init];
    CTCarrier *carrier = networkInfo.subscriberCellularProvider;
    if (carrier.carrierName) {

        return carrier.carrierName;
    }
    return @"";
}

- (NSString *)UDID {
    
    NSString *udid = [SSKeychain passwordForService:service account:account];
    if (udid.length > 0) {
        
        return udid;
    }
    else {
        
        udid = [OpenUDID value];
        [SSKeychain setPassword:udid forService:service account:account];
        return udid;
    }
}

- (void)removeUDID {
    
    [SSKeychain deletePasswordForService:service account:account];
}

- (void)saveDeviceToken:(NSString *)deviceToken {
    
    [NSUserDefaults ld_setDeviceToken:deviceToken];
}

- (NSString *)DeviceToken {
    
    return [NSUserDefaults ld_deviceToken];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
}

- (void)saveAccessToken:(NSString *)accessToken {
    
    [NSUserDefaults ld_saveAccessToken:accessToken];
}

- (NSString *)accessToken {
    
    return [NSUserDefaults ld_accessToken];
}

@end
