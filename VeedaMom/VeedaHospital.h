//
//  VeedaHospital.h
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 13/3/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol VeedaHospital


@end

@interface VeedaHospital : JSONModel

@property (assign, nonatomic) float lat;
@property (assign, nonatomic) float lng;
@property (strong, nonatomic) NSString* name;

@end
