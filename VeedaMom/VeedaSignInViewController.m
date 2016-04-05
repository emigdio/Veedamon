//
//  VeedaSignInViewController.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 8/1/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaSignInViewController.h"
#import "VeedaHomeViewController.h"
#import "VeedaSignUpViewController.h"

@interface VeedaSignInViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelForgotPassword;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUser;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UIView *viewForgotPassword;
@property (weak, nonatomic) IBOutlet UIButton *buttonLogIn;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignUp;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightUserField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightPasswordField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightButtonSignUp;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightButtonLogIn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightForgotButton;



@end

@implementation VeedaSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
}

/**
 * It sets up everything related to the User Interface.
 *
 * @param
 * @return
 */
- (void) setupUI
{
    
    UIColor *color = [UIColor whiteColor];
    self.textFieldUser.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"USER_TEXTFIELD", nil) attributes:@{NSForegroundColorAttributeName: color}];
    self.textFieldPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"PASSWORD_TEXTFIELD", nil) attributes:@{NSForegroundColorAttributeName: color}];
    
    color = [UIColor colorWithRed:91.0/255.0 green:176.0/255.0 blue:237.0/255.0 alpha:1.0];
    
    
    NSDictionary *attribs =
                              @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle), NSForegroundColorAttributeName : color };
    NSMutableAttributedString *attributedText =
    [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"FORGET_PASSWORD", nil)
                                           attributes:attribs];
    
    self.labelForgotPassword.attributedText = attributedText;

    [self.buttonLogIn setTitle:NSLocalizedString(@"LOG_IN_BUTTON", nil) forState:UIControlStateNormal];
    
    [self.buttonSignUp setTitle:NSLocalizedString(@"SIGN_UP_BUTTON", nil) forState:UIControlStateNormal];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
    }else{
    
        self.textFieldUser.font = [UIFont fontWithName:@"HelveticaNeue" size:30];
        
        self.textFieldPassword.font = [UIFont fontWithName:@"HelveticaNeue" size:30];
        
        self.buttonLogIn.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:30];
        
        self.buttonSignUp.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:30];
        
        self.labelForgotPassword.font = [UIFont fontWithName:@"HelveticaNeue" size:30];
        
        self.heightButtonLogIn.constant = 60;
        
        self.heightButtonSignUp.constant = 60;
        
        self.heightPasswordField.constant = 60;
        
        self.heightUserField.constant = 60;
        
        self.heightForgotButton.constant = 60;
    
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonSignInIsPressed:(id)sender {
    
    VeedaHomeViewController *veedaHomeViewController = [[VeedaHomeViewController  alloc] init];
    
    [[self navigationController] pushViewController:veedaHomeViewController animated:YES];
    
}


- (IBAction)buttonSignUpIsPressed:(id)sender {
    
    VeedaSignUpViewController *veedaSignUpViewController = [[VeedaSignUpViewController  alloc] init];
    
    [[self navigationController] pushViewController:veedaSignUpViewController animated:YES];
    
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
