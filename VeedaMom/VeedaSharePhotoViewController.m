//
//  VeedaSharePhotoViewController.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 28/3/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaSharePhotoViewController.h"

@interface VeedaSharePhotoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewPhoto;




@end

@implementation VeedaSharePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    self.imageViewPhoto.image = self.photo;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goToBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
