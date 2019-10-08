//
//  MertricManager.m
//  GeneralDylib
//
//  Created by David.Dai on 2019/7/5.
//  Copyright © 2019 david. All rights reserved.
//

#import "MertricManager.h"

@implementation MertricManager

+ (instancetype)shared {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.metricManager = [MXMetricManager sharedManager];
        [self.metricManager addSubscriber:self];
    }
    return self;
}

- (void)dealloc {
    [self.metricManager removeSubscriber:self];
}

- (void)didReceiveMetricPayloads:(NSArray<MXMetricPayload *> *)payloads {
    NSString *curTime = [NSString stringWithFormat:@"%@", @([MTHawkeyeUtility currentTime])];
    NSMutableArray *array = [NSMutableArray array];
    for (MXMetricPayload *metricPayload in payloads) {
        [array addObject:metricPayload.DictionaryRepresentation];
    }
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
    if (!error) {
        NSString *value = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        [[MTHawkeyeStorage shared] asyncStoreValue:value withKey:curTime inCollection:@"MetricPayload"];
    }
}
@end
