//
//  VeedaHospitalsModel.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 13/3/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaHospitalsModel.h"

@implementation VeedaHospitalsModel

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"results": @"hospitals"
                                                      }];
}

@end
