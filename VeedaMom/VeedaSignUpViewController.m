//
//  VeedaSignUpViewController.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 10/1/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaSignUpViewController.h"
#import "VeedaUtils.h"

@interface VeedaSignUpViewController ()
@property (weak, nonatomic) IBOutlet UIView *headerViewContent;
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCountry;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAge;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (weak, nonatomic) IBOutlet UITextField *textFieldRePassword;
@property (weak, nonatomic) IBOutlet UILabel *labelNumberPhone1;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNumberPhone1;
@property (weak, nonatomic) IBOutlet UILabel *labelNumberPhone2;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNumberPhone2;

@end

@implementation VeedaSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    
    
    [VeedaUtils addVeedaHeaderHere:self inThisView:self.headerViewContent andWithThisTitle:nil];
    
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
    
    UIColor *color = [UIColor whiteColor];
    self.textFieldName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Nombre y Apellido" attributes:@{NSForegroundColorAttributeName: color}];
    self.textFieldCountry.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"País" attributes:@{NSForegroundColorAttributeName: color}];
    self.textFieldEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"email" attributes:@{NSForegroundColorAttributeName: color}];
    self.textFieldAge.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"edad" attributes:@{NSForegroundColorAttributeName: color}];
    self.textFieldUserName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Nombre de usuario" attributes:@{NSForegroundColorAttributeName: color}];
    self.textFieldPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Clave" attributes:@{NSForegroundColorAttributeName: color}];
    self.textFieldRePassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirmar clave" attributes:@{NSForegroundColorAttributeName: color}];
   
}

- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    
    // If the user pressed the RETURN key, the keyboard is hidden.
    if([string isEqualToString:@"\n"])
    {
        [textField resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    //if text is equal to placeholder then the text is empty
    
    if (textField.tag == 1) {
        
        self.labelNumberPhone1.text = @"";
        
    }else if (textField.tag == 2) {
        
        self.labelNumberPhone2.text = @"";
        
    }
    
    [textField becomeFirstResponder];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    //if text is empty put placeholder text
    if ((textField.tag == 1) && ([textField.text isEqualToString:@""]))
    {
        
        self.labelNumberPhone1.text = @"Nro. de contacto de un familiar en caso de emergencia";
        
    }else if ((textField.tag == 2) && ([textField.text isEqualToString:@""])){
        
        self.labelNumberPhone2.text = @"Nro. de contacto de un amigo/a en caso de emergencia";
        
    }
    
    [textField resignFirstResponder];
}




-(BOOL) textFieldShouldEndEditing:(UITextField *)textField{
    //hide keyboard
    [textField resignFirstResponder];
    return YES;
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
