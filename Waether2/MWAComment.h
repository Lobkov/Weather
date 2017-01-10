//
//  MWAComment.h
//  Waether2
//
//  Created by Dmitry on 03.01.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MWAComment : NSObject
@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *authorEmail;

+(MWAComment *)commentWithMessage:(NSString *)message authorEmail:(NSString *)authorEmail;

@end
