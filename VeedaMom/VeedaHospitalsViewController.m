//
//  VeedaHospitalsViewController.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 12/3/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaHospitalsViewController.h"
#import "VeedaHospitalsNearFacade.h"
#import "VeedaUtils.h"
#import "VeedaHospitalsModel.h"
#import "VeedaHospital.h"


@import GoogleMaps;

@interface VeedaHospitalsViewController (){

GMSMapView *mapView_;
    

    
}



@property (weak, nonatomic) IBOutlet UIView *viewMap;

@end

@implementation VeedaHospitalsViewController{
    
    CLLocationManager *locationManager;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //  Register this controller as an observer for the HANDICAP_CARD_REQUEST_SUCCESSFUL_NOTIFICATION  notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listHospitalsWasReceived:) name:HOSPITALS_LIST_REQUEST_SUCCESSFUL_NOTIFICATION object:nil];
    

    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    //Configure Accuracy depending on your needs, default is kCLLocationAccuracyBest
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    // Set a movement threshold for new events.
    locationManager.distanceFilter = 500; // meters
 
    
    //iOS 8 API change
    if([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [locationManager requestWhenInUseAuthorization];
          [locationManager requestAlwaysAuthorization];
    }else{
        [locationManager startUpdatingLocation];
    }
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    CGRect frame = CGRectMake(0, 0, screenWidth, screenHeight -94);
    
    mapView_ = [[GMSMapView alloc] initWithFrame:frame];
    
    mapView_.myLocationEnabled = YES;
    
    NSLog(@"User's location: %@", mapView_.myLocation);
    
    [self.viewMap addSubview:mapView_];
    
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
   
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    
    
    NSDate* eventDate = newLocation.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (fabs(howRecent) < 15.0) {
        GMSCameraPosition *sydney = [GMSCameraPosition cameraWithLatitude:newLocation.coordinate.latitude
                                                                longitude:newLocation.coordinate.longitude
                                                                     zoom:14];
        [mapView_ setCamera:sydney];
        
        
         [[VeedaHospitalsNearFacade sharedInstance] getInfoHospitalsWithLat:newLocation.coordinate.latitude andWithLng:newLocation.coordinate.longitude];
        
        
    }

    
        
      
    

}




-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
        {
            NSLog(@"didFailWithError: %@", @"kCLAuthorizationStatusNotDetermined");
        }
        case kCLAuthorizationStatusRestricted:
        {
            NSLog(@"didFailWithError: %@", @"kCLAuthorizationStatusRestricted");
        }
            
        case kCLAuthorizationStatusDenied:
        {
            NSLog(@"didFailWithError: %@", @"kCLAuthorizationStatusDenied");
        }
            break;
        default:{
            [locationManager startUpdatingLocation];
        }
            break;
    }
}

#pragma mark - Notificaciones

-(void)listHospitalsWasReceived:(NSNotification *)notification{
    
    VeedaHospitalsModel *veedaHospitalsModel = notification.object;
    
    for (int i=0; i<veedaHospitalsModel.hospitals.count; i++) {
        
        VeedaHospital *veedaHospital = veedaHospitalsModel.hospitals[i];
        
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake(veedaHospital.lat, veedaHospital.lng);
        GMSMarker *london = [GMSMarker markerWithPosition:position];
        london.title = veedaHospital.name;
        london.icon = [UIImage imageNamed:@"iconHospital.png"];
        london.map = mapView_;
    
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
