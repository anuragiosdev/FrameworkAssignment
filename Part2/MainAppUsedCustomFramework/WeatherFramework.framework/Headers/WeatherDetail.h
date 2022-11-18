//
//  WeatherDetail.h
//  WeatherFramework
//
//  Created by Anurag Sharma on 17/11/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WeatherDetail <NSObject>

@property (readonly) NSString *currentTemprature;
@property (readonly) NSString *maxTemprature;
@property (readonly) NSString *minTemprature;
@property (readonly) NSString *humidity;
@property (readonly) NSString *pressure;
@property (readonly) NSString *seaLevel;

@end

NS_ASSUME_NONNULL_END
