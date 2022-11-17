//
//  ViewController.m
//  AssignmentWeatherMainApp
//
//  Created by Anurag Sharma on 17/11/22.
//

#import "ViewController.h"
#import "WeatherService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   WeatherService *service = [[WeatherService alloc]init];
  [service weatherInfoWithLatitude:1.2
                     withLongitude:2.1
                    withCompletion:^(id<WeatherDetail> _Nonnull weatherDetail) {
      
      NSLog(@"TEMP = %@", weatherDetail.currentTemprature );
      NSLog(@"MAX TEMP = %@", weatherDetail.maxTemprature );
      NSLog(@"MIN TEMP = %@", weatherDetail.maxTemprature );
      NSLog(@"Pressure = %@", weatherDetail.pressure );
      NSLog(@"Humidity = %@", weatherDetail.humidity );
      NSLog(@"Sea Level = %@", weatherDetail.seaLevel );

    }];
}

@end
