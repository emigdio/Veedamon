//
//  VeedaHeaderBarViewController.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 12/1/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaHeaderBarViewController.h"
#import "SWRevealViewController.h"

@interface VeedaHeaderBarViewController ()

    @property (strong, nonatomic) SWRevealViewController   *revealController;

@end

@implementation VeedaHeaderBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bell.png"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];

    _revealController = [self revealViewController];
    
    //    //[self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    [_revealController panGestureRecognizer];
    [_revealController tapGestureRecognizer];
    
    UIBarButtonItem * revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu.png"] style:UIBarButtonItemStylePlain target:_revealController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:113.0/255.0 green:70.0/255.0 blue:137.0/255.0 alpha:0.6];
    
    NSLog(@"\n\n......\n%@ %@", _revealController, revealButtonItem);
    
    
    [_revealController panGestureRecognizer].enabled = YES;
    [_revealController tapGestureRecognizer].enabled = YES;
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
