//
//  WeatherService.m
//  WeatherFramework
//
//  Created by Anurag Sharma on 17/11/22.
//

#import "WeatherService.h"
#import "WeatherData.h"

@implementation WeatherService

-(NSString *) weatherAppID {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"WeatherAPIKEY"];
}

-(void) weatherInfoWithLatitude:(double)latitude
                  withLongitude:(double)longitude
                 withCompletion:(void (^)(id <WeatherDetail>))callback {
    NSString *appID = [self weatherAppID];
    NSString *weathrAPIURL = [[NSString alloc] initWithFormat: @"https://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&appid=%@",latitude,longitude,appID];
    NSURL *url = [NSURL URLWithString: weathrAPIURL];
    
    [self fetchWeatherDataWithURL:url withCompletion:^(id<WeatherDetail> weatherData) {
        callback(weatherData);
    }];
}

-(void) fetchWeatherDataWithURL:(NSURL*) url
          withCompletion:(void (^)(id <WeatherDetail>))callback {
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200)
        {
            NSError *parseError = nil;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            NSDictionary *keyInformation = [responseDictionary objectForKey:@"main"];
            WeatherData *data = [[WeatherData alloc] initWithKeyInformation: keyInformation];
            callback(data);
        }
        else
        {
            NSLog(@"Error");
        }
    }];
    [dataTask resume];
}

@end
