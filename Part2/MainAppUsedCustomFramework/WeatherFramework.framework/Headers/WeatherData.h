//
//  WeatherData.h
//  WeatherFramework
//
//  Created by Anurag Sharma on 17/11/22.
//

#import <Foundation/Foundation.h>
#import "WeatherDetail.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherData : NSObject<WeatherDetail>

@property (readonly) NSString *currentTemprature;
@property (readonly) NSString *maxTemprature;
@property (readonly) NSString *minTemprature;
@property (readonly) NSString *humidity;
@property (readonly) NSString *pressure;
@property (readonly) NSString *seaLevel;

-(id)initWithKeyInformation:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
