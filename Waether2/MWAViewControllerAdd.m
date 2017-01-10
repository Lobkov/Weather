//
//  MWAViewControllerAdd.m
//  Waether2
//
//  Created by Dmitry on 03.01.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "MWAViewControllerAdd.h"
#import "MWAWeather.h"
#import "Backendless.h"

@implementation MWAViewControllerAdd

- (IBAction)addDidTouchUpInside:(id)sender {

//Сохраниение погоды на backendless
    NSNumber *temp  = @([self.tempTextBox.text doubleValue]);
    NSNumber *prec = @([self.percTextBox.text doubleValue]);
    NSDate *dateWeather = [NSDate date];
    MWAWeather *w = [MWAWeather weatherWithTemp:temp precipitation:prec weatherDate:dateWeather authorEmail:@"ya@my.com"];
   
    [backendless.persistenceService save: w];
 //Есть ли смысл всё что выше писать в одну строчку? Будет нечитабельно.
#warning Это на твое усмотрение. 15 экранов кода в одном файле тоже неудобно. Если считаешь, что так удобнее, то переноси. Я бы в этом случае не, скорее всего, стал – вызов простой, все и так перед глазами.
}
@end
