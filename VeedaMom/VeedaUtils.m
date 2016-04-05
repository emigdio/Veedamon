//
//  VeedaUtils.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 14/1/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaUtils.h"

@implementation VeedaUtils

/**
 * Adds a navigation bar, to the input "viewController", that has a BACK button and a logo in the middle. It also has a title which text will be fill with the text found in input string "title".
 *
 * @param viewController        View controller where the header will be placed.
 * @param title                 Title that will be shown in the header to be added.
 * @param view                  View, that's inside the view controller "viewController", where the header will be placed.
 * @return
 */
+ (void) addVeedaHeaderHere:(UIViewController*)viewController
                 inThisView:(UIView*)view
           andWithThisTitle:(NSString*)title
{
    UIBarButtonItem *backButton;
    UIImageView *logo;
    UIImage *logoImg;
    UIView *square;
    CGRect sqFrame, logoFrame;
    NSInteger screenWidth, logoWidth, logoHeight;
    
    // Getting widths and heights
    screenWidth = [UIScreen mainScreen].bounds.size.width;
    logoWidth  = 112;
    logoHeight = 27;
  
    sqFrame = CGRectMake(0,20, screenWidth, 37);
    
    square = [[UIView alloc] initWithFrame:sqFrame];
    //square.backgroundColor = [UIColor purpleColor];

    
    // Creating logo
    logoImg = [UIImage imageNamed:@"logoVeedamom.png"];
    logoFrame = CGRectMake((screenWidth - logoWidth) * 0.5,
                           5,
                           logoWidth,
                           logoHeight);
    logo = [[UIImageView alloc] initWithImage:logoImg];
    logo.frame = logoFrame;

    
    // Adding logo to background square
    //[square addSubview:logo];
    
    // Adding backgroud square to this view.
    //[view addSubview:square];
    
    //[viewController.navigationController.navigationBar addSubview:square];
    
    // Creating Back button.
    backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    // Adding Back button.
    [[viewController navigationItem] setBackBarButtonItem:backButton];
    
    [viewController.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    viewController.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // Displaying navigation bar
    viewController.navigationController.navigationBar.hidden = NO;
}

@end
