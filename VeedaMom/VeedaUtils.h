//
//  VeedaUtils.h
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 14/1/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*********************
 *                   *
 *   NOTIFICATIONS   *
 *                   *
 *********************/

// Networking
static NSString* const HOSPITALS_LIST_REQUEST_SUCCESSFUL_NOTIFICATION   = @"HOSPITALS_LIST_REQUEST_SUCCESSFUL_NOTIFICATION";
static NSString* const HOSPITALS_LIST_REQUEST_UNSUCCESSFUL_NOTIFICATION = @"HOSPITALS_LIST_REQUEST_UNSUCCESSFUL_NOTIFICATION";

@interface VeedaUtils : NSObject

+ (void) addVeedaHeaderHere:(UIViewController*)viewController
                 inThisView:(UIView*)view
           andWithThisTitle:(NSString*)title;

@end
