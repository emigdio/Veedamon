//
//  VeedaHospitalsModel.h
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 13/3/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "VeedaHospital.h"

@interface VeedaHospitalsModel : JSONModel

@property (strong, nonatomic) NSArray<VeedaHospital>* hospitals;


@end
