//
//  VeedaHospitalsNearFacade.h
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 13/3/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VeedaHospitalsNearFacade : NSObject

+ (VeedaHospitalsNearFacade *) sharedInstance;

- (void) getInfoHospitalsWithLat:(float)lat andWithLng:(float)lng;

@end
