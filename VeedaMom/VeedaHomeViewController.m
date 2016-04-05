//
//  VeedaHomeViewController.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 10/1/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaHomeViewController.h"
#import "SWRevealViewController.h"
#import "VeedaEvaluationViewController.h"
#import "VeedaHomeHospitalsViewController.h"
#import "VeedaShareHomeViewController.h"

@interface VeedaHomeViewController ()

 @property (strong, nonatomic) SWRevealViewController   *revealController;
@property (weak, nonatomic) IBOutlet UIView *viewTapMenu;
@property (weak, nonatomic) IBOutlet UILabel *labelUsername;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *buttomSpaceButtons;
@property (weak, nonatomic) IBOutlet UILabel *labelTest;
@property (weak, nonatomic) IBOutlet UILabel *labelHospital;
@property (weak, nonatomic) IBOutlet UILabel *labelVideos;
@property (weak, nonatomic) IBOutlet UILabel *labelExercices;
@property (weak, nonatomic) IBOutlet UILabel *labelShare;
@property (weak, nonatomic) IBOutlet UILabel *labelDiary;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *widthLabels;

@end

@implementation VeedaHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _revealController = [self revealViewController];
    
    //    //[self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    [_revealController panGestureRecognizer];
    [_revealController tapGestureRecognizer];
    
    UITapGestureRecognizer *menuTap =
    [[UITapGestureRecognizer alloc] initWithTarget:_revealController
                                            action:@selector(revealToggle:)];
    
    [self.viewTapMenu addGestureRecognizer:menuTap];

    [self setupUI];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * It sets up everything related to the User Interface.
 *
 * @param
 * @return
 */
- (void) setupUI
{
   
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"Hola, Carmen Castillo"];
    
    UIColor *color = [UIColor colorWithRed:91.0/255.0 green:176.0/255.0 blue:237.0/255.0 alpha:1.0];

    [attributedString setAttributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle), NSForegroundColorAttributeName : color } range:NSMakeRange(6, 15)];
    
    self.labelUsername.attributedText = attributedString;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
    }else{
        
        for (int i=0; i< self.buttomSpaceButtons.count; i++) {
            
            NSLayoutConstraint *spaceBottom =self.buttomSpaceButtons[i];
            
            spaceBottom.constant = 120;
            
        }
        
        for (int i=0; i< self.widthLabels.count; i++) {
            
            NSLayoutConstraint *widthLabel =self.widthLabels[i];
            
            widthLabel.constant = 230;
            
        }
        self.labelDiary.font = [UIFont fontWithName:@"HelveticaNeue" size:25];
        self.labelExercices.font = [UIFont fontWithName:@"HelveticaNeue" size:25];
        self.labelHospital.font = [UIFont fontWithName:@"HelveticaNeue" size:25];
        self.labelShare.font = [UIFont fontWithName:@"HelveticaNeue" size:25];
        self.labelVideos.font = [UIFont fontWithName:@"HelveticaNeue" size:25];
        self.labelTest.font = [UIFont fontWithName:@"HelveticaNeue" size:25];
    
    }
}


- (IBAction)goToRating:(id)sender {
    
    VeedaEvaluationViewController *veedaEvaluationViewController = [[VeedaEvaluationViewController  alloc] init];
    
    [[self navigationController] pushViewController:veedaEvaluationViewController animated:YES];
    
}

- (IBAction)goToHospitals:(id)sender {
    
    VeedaHomeHospitalsViewController *veedaHomeHospitalsViewController = [[VeedaHomeHospitalsViewController  alloc] init];
    
    [[self navigationController] pushViewController:veedaHomeHospitalsViewController animated:YES];

}


- (IBAction)goToShare:(id)sender {
    
    VeedaShareHomeViewController *veedaShareHomeViewController = [[VeedaShareHomeViewController  alloc] init];
    
    [[self navigationController] pushViewController:veedaShareHomeViewController animated:YES];
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
