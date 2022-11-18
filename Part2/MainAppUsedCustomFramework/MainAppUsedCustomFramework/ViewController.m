//
//  ViewController.m
//  MainAppUsedCustomFramework
//
//  Created by Anurag Sharma on 18/11/22.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
UIActivityIndicatorView *activityIndicator;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)OnFetchWeatherData:(id)sender {
    WeatherService *service = [[WeatherService alloc]init];
    [self showActivityIndicator];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [service weatherInfoWithLatitude:18.5204
                           withLongitude:73.8567
                          withCompletion:^(id<WeatherDetail> _Nonnull weatherDetail) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateDetail:weatherDetail];
            });
        }];
    });
    
}

-(void) showActivityIndicator {
    activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    activityIndicator.frame = CGRectMake(round((self.view.frame.size.width - 25) / 2), round((self.view.frame.size.height - 25) / 2), 25, 25);
    [self.view addSubview:activityIndicator];
    [self.view bringSubviewToFront:activityIndicator];
    [activityIndicator startAnimating];
}

-(void) updateDetail: (id<WeatherDetail>) weatherDetail {
    self.tempAvg.text = [NSString stringWithFormat: @"%@",weatherDetail.currentTemprature];
    self.temp_max.text = [NSString stringWithFormat: @"%@",weatherDetail.maxTemprature];
    self.temp_min.text = [NSString stringWithFormat: @"%@",weatherDetail.minTemprature];
    self.pressure.text = [NSString stringWithFormat: @"%@",weatherDetail.pressure];
    self.humidity.text = [NSString stringWithFormat: @"%@",weatherDetail.humidity];
    self.sea_level.text = [NSString stringWithFormat: @"%@",weatherDetail.seaLevel];
    
    [activityIndicator stopAnimating];
    [activityIndicator removeFromSuperview];
}

@end
