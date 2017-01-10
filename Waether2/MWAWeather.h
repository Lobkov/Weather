//
//  MWAWeather.h
//  Waether2
//
//  Created by Dmitry on 03.01.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWAWeather : NSObject
@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, strong) NSNumber *temperature;        //Температура воздуха, °C
@property (nonatomic, strong) NSNumber *precipitation;      //Количество осадков, мм
@property (nonatomic, strong) NSDate *weatherDate;          //Дата занесения показаний погоды в базу = сегодняшняя дата
@property (nonatomic, strong) NSString *authorEmail;        //Email автора изменений показаний погоды

+(MWAWeather *) weatherWithTemp:(NSNumber *)temperature precipitation:(NSNumber *)precipitation weatherDate:(NSDate *) weatherDate authorEmail:(NSString *)authorEmail;
- (NSComparisonResult) compare: (MWAWeather *) weatherObject;

@end
