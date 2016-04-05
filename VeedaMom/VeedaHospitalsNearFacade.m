//
//  VeedaHospitalsNearFacade.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 13/3/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaHospitalsNearFacade.h"
#import "VeedaHospitalsModel.h"
#import "AFNetworking.h"
#import "VeedaUtils.h"

@implementation VeedaHospitalsNearFacade

+ (VeedaHospitalsNearFacade *) sharedInstance
{
    static VeedaHospitalsNearFacade *inst = nil;
    @synchronized(self)
    {
        if (!inst)
        {
            inst = [[self alloc] init];
        }
    }
    return inst;
    
}

- (void) getInfoHospitalsWithLat:(float)lat andWithLng:(float)lng{
    
    NSString *latLng = [[NSString alloc]initWithFormat:@"%f,%f",lat,lng ];
    
    NSString *URLString = @"https://maps.googleapis.com/maps/api/place/nearbysearch/json";
    NSDictionary *parameters = @{@"key": @"AIzaSyA_otPx9lTYYYWb3ZTWiNc-vHNt973eImM", @"location": latLng , @"types":@"hospital",@"radius":@"5000"};
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:parameters error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            
            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:HOSPITALS_LIST_REQUEST_UNSUCCESSFUL_NOTIFICATION object:nil]];
            
        } else {
            NSLog(@"%@ %@", response, responseObject);
            
            //got response
            NSDictionary *json =responseObject;
            
            NSError* err = nil;
            
            //parse Json using JSONModel library  for to get object GrintHandicap
            VeedaHospitalsModel *veedaHospitalsModel = [[VeedaHospitalsModel alloc] initWithDictionary:json error:&err];
            
            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:HOSPITALS_LIST_REQUEST_SUCCESSFUL_NOTIFICATION object:veedaHospitalsModel]];
            
            NSLog(@"date: %@", veedaHospitalsModel.hospitals);
            
        }
    }];
    [dataTask resume];
   
    
    
}


@end
