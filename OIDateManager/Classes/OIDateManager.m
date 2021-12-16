//
//  OIDateManager.m
//  NetworkTest
//
//  Created by mac on 2021/12/9.
//

#import "OIDateManager.h"

@implementation OIDateManager

/**  -----------------------------------------------------------------获取_时间戳--------------------------------------------------------------------------  */
/// 获取<当前>时间戳
- (NSNumber *)getCurrentDateTimeIntervalToTheMillisecond:(BOOL)isMillisecond
{
    NSDate *currentDate = [NSDate date];
    if (isMillisecond) {
        NSTimeInterval timeInterval_1000 = [currentDate timeIntervalSince1970] * 1000; /// 乘*1000 是精确到毫秒
        return [NSNumber numberWithDouble:timeInterval_1000];
    }
    NSTimeInterval timeInterval = [currentDate timeIntervalSince1970]; /// 不乘*1000 就是精确到秒
    return [NSNumber numberWithDouble:timeInterval];
}

/// 获取<yyyy-MM-dd hh:mm:ss>时间戳
- (NSNumber *)getDateTimeIntervalWithDateString:(NSString *)dateString dateFormat:(NSString *)dateFormat toTheMillisecond:(BOOL)isMillisecond
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat; /// 设置日期格式<yyyy-MM-dd hh:mm:ss>
    dateFormatter.timeZone = [self currentTimeZone];
    dateFormatter.locale = [[NSLocale alloc]initWithLocaleIdentifier:[NSLocale preferredLanguages].firstObject];
    dateFormatter.lenient = YES; /// 如果当前时间不存在，就获取距离最近的整点时间
    
    
    NSDate *currentDate = [dateFormatter dateFromString:dateString]; /// <yyyy-MM-dd hh:mm:ss>时间字符 转成 NSDate
    if (isMillisecond) {
        NSTimeInterval timeInterval_1000 = [currentDate timeIntervalSince1970] * 1000; /// 乘*1000 是精确到毫秒
        return [NSNumber numberWithDouble:timeInterval_1000];
    }
    NSTimeInterval timeInterval = [currentDate timeIntervalSince1970]; /// 不乘*1000 就是精确到秒
    return [NSNumber numberWithDouble:timeInterval];
}

/**  -----------------------------------------------------------------获取_时间--------------------------------------------------------------------------  */
/// 获取<当前>时间
- (NSString *)getCurrentDateTimeWithDateFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    /** 设置格式，hh：12小时制，HH：24小时制  */
    [dateFormatter setDateFormat:dateFormat];
    
    NSDate *currentDate = [NSDate date]; /// 当前时间date
    
    return [dateFormatter stringFromDate:currentDate];
}

/// 获取<时间戳>时间
- (NSString *)getDateTimeWithTimeInterval:(NSTimeInterval)timeInterval dateFormat:(NSString *)dateFormat toTheMillisecond:(BOOL)isMillisecond
{
    if (!isMillisecond) timeInterval = timeInterval*1000; /// *1000精确到毫秒（精确到毫秒的不用乘）
    timeInterval = timeInterval/1000; /// 除1000精确到秒
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    /** 设置格式，hh：12小时制，HH：24小时制  */
    [dateFormatter setDateFormat:dateFormat];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval]; /// 时间戳对应的时间date
    
    return [dateFormatter stringFromDate:date];
}


/**  -----------------------------------------------------------------其他--------------------------------------------------------------------------  */

#pragma mark - 获取当前时区(不使用夏时制)

- (NSTimeZone *)currentTimeZone
{
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone]; /// 当前时区
    NSInteger seconds = [localTimeZone secondsFromGMTForDate:[NSDate date]]; /// 当前时区相对于GMT(零时区)的偏移秒数
    /**
     当前时区(不使用夏时制)：由偏移量获得对应的NSTimeZone对象
     注意：一些夏令时时间 NSString 转 NSDate 时，默认会导致 NSDateFormatter 格式化失败，返回 null
     */
    return [NSTimeZone timeZoneForSecondsFromGMT:seconds];
}

/**  ----------------------------------------------------------------- 更新 --------------------------------------------------------------------------  */
- (void)updataManager {
    NSLog(@"更新 -Manager- 0.1.2 -");
}

@end
