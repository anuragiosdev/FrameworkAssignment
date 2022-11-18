//
//  WeatherProtocol.h
//  WeatherFramework
//
//  Created by Anurag Sharma on 17/11/22.
//

#import <Foundation/Foundation.h>
#import "WeatherDetail.h"

NS_ASSUME_NONNULL_BEGIN
@class WeatherDetail;
@protocol WeatherProtocol <NSObject>
-(void) weatherInfoWithLatitude:(double)latitude
                                withLongitude:(double)longitude
                               withCompletion:(void (^)(id <WeatherDetail>))callback;
@end

NS_ASSUME_NONNULL_END
