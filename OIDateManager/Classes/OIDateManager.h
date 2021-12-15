//
//  OIDateManager.h
//  NetworkTest
//
//  Created by mac on 2021/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OIDateManager : NSObject

/// 获取当前时间戳
- (NSNumber *)getCurrentDateTimeIntervalToTheMillisecond:(BOOL)isMillisecond;

/// 获取<yyyy-MM-dd hh:mm:ss>时间戳
- (NSNumber *)getDateTimeIntervalWithDateString:(NSString *)dateString
                                     dateFormat:(NSString *)dateFormat
                               toTheMillisecond:(BOOL)isMillisecond;

/// 获取当前时间
- (NSString *)getCurrentDateTimeWithDateFormat:(NSString *)dateFormat;

/// 获取<时间戳>时间
- (NSString *)getDateTimeWithTimeInterval:(NSTimeInterval)timeInterval
                               dateFormat:(NSString *)dateFormat
                         toTheMillisecond:(BOOL)isMillisecond;

/// 更新
- (void)updataManager;

@end

NS_ASSUME_NONNULL_END
