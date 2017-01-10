//
//  MWAWeather.m
//  Waether2
//
//  Created by Dmitry on 03.01.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "MWAWeather.h"

@implementation MWAWeather
@synthesize objectId, temperature, precipitation, weatherDate, authorEmail;

+(MWAWeather *) weatherWithTemp:(NSNumber *)temperature precipitation:(NSNumber *)precipitation weatherDate:(NSDate *) weatherDate authorEmail:(NSString *)authorEmail
{
    MWAWeather *weather = [MWAWeather new];
    weather.temperature = temperature;
    weather.precipitation = precipitation;
    weather.weatherDate = weatherDate;
    weather.authorEmail = authorEmail;
    return weather;
}


- (NSComparisonResult) compare: (MWAWeather *) weatherObject
{
    return [self.weatherDate compare:weatherObject.weatherDate];
}
@end
