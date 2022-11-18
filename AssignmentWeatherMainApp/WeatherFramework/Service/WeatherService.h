//
//  WeatherService.h
//  WeatherFramework
//
//  Created by Anurag Sharma on 17/11/22.
//

#import <Foundation/Foundation.h>
#import "WeatherProtocol.h"
#import "WeatherDetail.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeatherService : NSObject<WeatherProtocol>
-(void) weatherInfoWithLatitude:(double)latitude
                                withLongitude:(double)longitude
                               withCompletion:(void (^)(id <WeatherDetail>))callback;
@end

NS_ASSUME_NONNULL_END
