//
//  VeedaHospital.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 13/3/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaHospital.h"

@implementation VeedaHospital

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                        @"geometry.location.lat": @"lat",
                                                        @"geometry.location.lng": @"lng",                                                       }];
}


@end
