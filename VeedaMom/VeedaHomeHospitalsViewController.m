//
//  VeedaHomeHospitalsViewController.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 13/3/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaHomeHospitalsViewController.h"
#import "VeedaHospitalsViewController.h"

@interface VeedaHomeHospitalsViewController ()

@end

@implementation VeedaHomeHospitalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)goToMapHospitals:(id)sender {
    
    VeedaHospitalsViewController *veedaHospitalsViewController = [[VeedaHospitalsViewController  alloc] init];
    
    [[self navigationController] pushViewController:veedaHospitalsViewController animated:YES];

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
