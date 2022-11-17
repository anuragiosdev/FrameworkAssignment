//
//  WeatherData.m
//  WeatherFramework
//
//  Created by Anurag Sharma on 17/11/22.
//

#import "WeatherData.h"

@implementation WeatherData
-(id) initWithKeyInformation:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _currentTemprature = [dictionary objectForKey: @"temp"];
        _maxTemprature = [dictionary objectForKey: @"temp_max"];
        _minTemprature = [dictionary objectForKey: @"temp_min"];
        _humidity = [dictionary objectForKey: @"humidity"];
        _pressure = [dictionary objectForKey: @"pressure"];
        _seaLevel = [dictionary objectForKey: @"sea_level"];

    }
    return self;
}

@end
