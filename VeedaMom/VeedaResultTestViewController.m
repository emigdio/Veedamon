//
//  VeedaResultTestViewController.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 5/3/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaResultTestViewController.h"
#import "SWRevealViewController.h"
#import "VeedaHomeViewController.h"

@interface VeedaResultTestViewController ()

@property (strong, nonatomic) SWRevealViewController   *revealController;

@property (weak, nonatomic) IBOutlet UIView *viewTapMenu;
@property (weak, nonatomic) IBOutlet UILabel *labelResult;
@property (weak, nonatomic) IBOutlet UIImageView *imageFace;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitle;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@end

@implementation VeedaResultTestViewController

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
    
    if (self.result == 1) {
        
        self.labelResult.text = @"De 0 a 10";
        
        self.button1.hidden = YES;
        
        self.button2.hidden = YES;
        
        self.imageFace.image = [UIImage imageNamed:@"faceHappy.png"];
        
        self.labelTitle.text = @"¡Te sientes bien!";
        
        self.labelSubtitle.text = @"Nos contenta, continúa lo que estas haciendo porque te funciona";
        
    }else if(self.result == 2) {
        
        self.labelResult.text = @"De 10 a 20";
        
        self.button1.titleLabel.text = @"Ver mi lista de acciones";
        
        self.button2.hidden = YES;
        
        self.imageFace.image = [UIImage imageNamed:@"faceSad.png"];
        
        self.labelTitle.text = @"Considera llamar a un familiar o a un amigo.";
        
        self.labelSubtitle.text = @"Es un buen momento para hacer los ejercicios o una actividad que te ayude a sentirte mejor, considera hablarlo con tu doctor o algún familiar y/o amigo. Presta atención a tu estado de ánimo! Avisale a tu doctor de algún cambio y repite el cuestionario la semana que viene sin falta!";
        
    }else if(self.result == 3) {
        
        self.labelResult.text = @"De 20 a 30";
        
        [self.button1 setTitle:@"llame al 1-800-273-8255" forState:UIControlStateNormal];
        
        [self.button2 setTitle:@"SMS al 741741" forState:UIControlStateNormal];
        
        self.imageFace.image = [UIImage imageNamed:@"faceSad.png"];
        
        self.labelTitle.text = @"Revisa tu plan de emergencia,";
        
        self.labelSubtitle.text = @"Discute los resultados con un doctor y recuerda que hablar con un amigo o familiar te puede ayudar a sentirte mejor!";
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    
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
