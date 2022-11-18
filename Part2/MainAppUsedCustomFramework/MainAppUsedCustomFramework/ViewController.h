//
//  ViewController.h
//  MainAppUsedCustomFramework
//
//  Created by Anurag Sharma on 18/11/22.
//

#import <UIKit/UIKit.h>
#import <WeatherFramework/WeatherService.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *tempAvg;
@property (weak, nonatomic) IBOutlet UILabel *temp_max;
@property (weak, nonatomic) IBOutlet UILabel *temp_min;

@property (weak, nonatomic) IBOutlet UILabel *sea_level;
@property (weak, nonatomic) IBOutlet UILabel *pressure;
@property (weak, nonatomic) IBOutlet UILabel *humidity;


- (IBAction)OnFetchWeatherData:(id)sender;

@end

