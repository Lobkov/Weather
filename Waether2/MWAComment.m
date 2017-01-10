//
//  MWAComment.m
//  Waether2
//
//  Created by Dmitry on 03.01.17.
//  Copyright © 2017 Dmitry. All rights reserved.
//

#import "MWAComment.h"

@implementation MWAComment
@synthesize authorEmail, message, objectId;

+(MWAComment *)commentWithMessage:(NSString *)message authorEmail:(NSString *)authorEmail
{
    MWAComment *comment = [MWAComment new];
    comment.message = message;
    comment.authorEmail = authorEmail;
    return comment;
}
@end
