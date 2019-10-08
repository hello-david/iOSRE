//
//  MertricManager.h
//  GeneralDylib
//
//  Created by David.Dai on 2019/7/5.
//  Copyright © 2019 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MetricKit/MetricKit.h>

#import <MTHawkeye/MTHStackFrameSymbolicsRemote.h>
#import <MTHawkeye/MTRunHawkeyeInOneLine.h>
#import <MTHawkeye/MTHawkeyeStorage.h>
#import <MTHawkeye/MTHawkeyeUtility.h>

NS_ASSUME_NONNULL_BEGIN
API_AVAILABLE(ios(13.0))
@interface MertricManager: NSObject <MXMetricManagerSubscriber>
@property (nonatomic, weak) MXMetricManager *metricManager;
@end

NS_ASSUME_NONNULL_END
