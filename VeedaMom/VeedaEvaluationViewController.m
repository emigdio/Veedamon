//
//  VeedaEvaluationViewController.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 27/2/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaEvaluationViewController.h"
#import "SWRevealViewController.h"
#import "VeedaResultTestViewController.h"

@interface VeedaEvaluationViewController (){
    
    ///number of current page that it displayed
    int page;
    
    int score;
    
    BOOL checkOption;
    
}

@property (strong, nonatomic) SWRevealViewController   *revealController;

@property (weak, nonatomic) IBOutlet UIView *viewTapMenu;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollviewMain;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *viewQuestions;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checks1;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checks2;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checks3;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checks4;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checks5;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checks6;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checks7;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checks8;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checks9;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *checks10;

#define IMAGE_CHECK @"check.png"

#define IMAGE_UNCHECK @"uncheck.png"


@end

@implementation VeedaEvaluationViewController

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
    
    
    //Configure UIScrollView
    [self.scrollviewMain setPagingEnabled:YES];
    [self.scrollviewMain setScrollEnabled:NO];
    [self.scrollviewMain setShowsHorizontalScrollIndicator:NO];
    [self.scrollviewMain setShowsVerticalScrollIndicator:NO];
    [self.scrollviewMain setDelegate:self];
    
    //get width of the screen
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    
    for (int i=0; i<self.viewQuestions.count; i++) {
        
        UIView *view = self.viewQuestions[i];
        
        view.frame = CGRectMake(screenWidth*(i+1), 0, screenWidth, screenHeight-100);
        
        //add views to scrollView
        [self.scrollviewMain addSubview:view];
    }
    
    page = 0;
    
    score = 0;
    
    //set content size of scrollView
    self.scrollviewMain.contentSize = CGSizeMake(screenWidth * 10, screenHeight-100);
    
    checkOption = YES;

}

-(void)viewDidAppear:(BOOL)animated{
    
    score = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)continueAction:(id)sender {
    
    if (checkOption) {
      
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        [self.scrollviewMain setContentOffset:CGPointMake(screenWidth*(page+1),0)];
        
        checkOption = NO;
        
    }else{
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Veedamom" message:NSLocalizedString(@"ALERT_SELECT_OPTION", nil) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    
    }
  
}

- (IBAction)checkQuestion:(id)sender {
    
    checkOption = YES;
    
    if (page == 1) {
        
        [self addCheck:self.checks1 withSender:sender];
    
    }else if (page == 2) {
        
        [self addCheck:self.checks2 withSender:sender];
        
    } else if (page == 3) {
        
        [self addCheck:self.checks3 withSender:sender];
        
    } else if (page == 4) {
        
        [self addCheck:self.checks4 withSender:sender];
        
    }else if (page == 5) {
        
        [self addCheck:self.checks5 withSender:sender];
        
    }else if (page == 6) {
        
        [self addCheck:self.checks6 withSender:sender];
        
    }else if (page == 7) {
        
        [self addCheck:self.checks7 withSender:sender];
        
    }else if (page == 8) {
        
        [self addCheck:self.checks8 withSender:sender];
        
    }else if (page == 9) {
        
        [self addCheck:self.checks9 withSender:sender];
        
    }else if (page == 10) {
        
        [self addCheck:self.checks10 withSender:sender];
        
    }

}


-(void)addCheck:(NSArray *)checks withSender:(id)sender{
    
    UIButton *check;
    
    for (int i =0; i< checks.count; i++) {
        
        check = checks[i];
        
        [check setBackgroundImage:[UIImage imageNamed:IMAGE_UNCHECK] forState:UIControlStateNormal];
        
    }
    
    check = (UIButton*)sender;
    
    [check setBackgroundImage:[UIImage imageNamed:IMAGE_CHECK] forState:UIControlStateNormal];
    
    if (check.tag == 4) {
        
        score = 50;
        
    }else{
        
        score = score + check.tag;
        
    }
    
    
}
- (IBAction)goToTestResult:(id)sender {
    
    VeedaResultTestViewController *veedaResultTestViewController = [[VeedaResultTestViewController  alloc] init];
    
    if (score <= 10 ) {
        
        veedaResultTestViewController.result = 1;
        
    }else if (score <= 20 ){
        
        veedaResultTestViewController.result = 2;
        
    }else if (score > 20 ){
        
        veedaResultTestViewController.result = 3;
        
    }
    
    [[self navigationController] pushViewController:veedaResultTestViewController animated:YES];

}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
    CGFloat pageWidth = self.scrollviewMain.frame.size.width;
    page = floor((self.scrollviewMain.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
  
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    
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
