//
//  VeedaShareHomeViewController.m
//  VeedaMom
//
//  Created by EMIGDIO CAMACHO CALDERON on 27/3/16.
//  Copyright © 2016 EMIGDIO CAMACHO CALDERON. All rights reserved.
//

#import "VeedaShareHomeViewController.h"
#import "CLImageEditor.h"
#import "VeedaSharePhotoViewController.h"
#import "VeedaGenderShareViewController.h"
#import "VeedaMonthShareViewController.h"

@interface VeedaShareHomeViewController () <CLImageEditorDelegate> {
    
   FDTakeController *fDTakeController;
    
   UIImage* imageToBePosted;
    
}

#define IMAGE_MAX_ALLOWED_SIZE_IN_KB 1800

@end

@implementation VeedaShareHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    fDTakeController  = [[FDTakeController alloc]init];
    fDTakeController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

/**
 * It compresses the image to be posted (several times if necessary) so its size is below the value of the IMAGE_MAX_ALLOWED_SIZE_IN_KB constant.
 *
 * @param
 * @return
 */
- (void) compressImageToBePosted
{
    NSData *imgData;
    int resizeAttemptsLeft;
    
    if(imageToBePosted != nil)
    {
        CGDataProviderRef provider;
        
        // Init some values
        resizeAttemptsLeft = 8;
        
        // Init image NSData with the image to be posted data.
        provider = CGImageGetDataProvider(imageToBePosted.CGImage);
        imgData = (id)CFBridgingRelease(CGDataProviderCopyData(provider));
        
        while ([imgData length] > IMAGE_MAX_ALLOWED_SIZE_IN_KB * 1000 && resizeAttemptsLeft > 0)
        {
            CGSize size;
            
            // Getting size of the image to be posted and divide it by 2
            size = imageToBePosted.size;
            size.height = size.height * 0.75;
            size.width  = size.width  * 0.75;
            
            // Resizing image to be posted by half
            //imageToBePosted = [imageToBePosted resizedImage:size interpolationQuality:kCGInterpolationHigh];
            
            // Setting new values for the loop variables.
            provider = CGImageGetDataProvider(imageToBePosted.CGImage);
            imgData = (id)CFBridgingRelease(CGDataProviderCopyData(provider));
            resizeAttemptsLeft -= 1;
        }
    }
}


#pragma mark - IBAction

- (IBAction)goToTakePhoto:(id)sender {
    
    [fDTakeController takePhotoOrChooseFromLibrary];

}
- (IBAction)goToGenderShare:(id)sender {
    
    VeedaGenderShareViewController *veedaGenderShareViewController = [[VeedaGenderShareViewController  alloc] init];
    
    [[self navigationController] pushViewController:veedaGenderShareViewController animated:YES];

}
- (IBAction)goToShareMonth:(id)sender {
    
    VeedaMonthShareViewController *veedaMonthShareViewController = [[VeedaMonthShareViewController  alloc] init];
    
    [[self navigationController] pushViewController:veedaMonthShareViewController animated:YES];

}

#pragma mark - FDTakeDelegate

/**
 * Delegate method after the user has started a take operation but cancelled it
 */
- (void)takeController:(FDTakeController *)controller didCancelAfterAttempting:(BOOL)madeAttempt{
    
    
}

/**
 * Delegate method after the user has started a take operation but it failed
 */
- (void)takeController:(FDTakeController *)controller didFailAfterAttempting:(BOOL)madeAttempt{
    
    
}

/**
 * Delegate method after the user has successfully taken or selected a photo
 */
- (void)takeController:(FDTakeController *)controller gotPhoto:(UIImage *)photo withInfo:(NSDictionary *)info{
    
    [self presentImageEditorWithImage:photo];
    
    
}

#pragma mark - CLImageEditor delegate

- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image
{
    imageToBePosted = image;
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    VeedaSharePhotoViewController *veedaSharePhotoViewController = [[VeedaSharePhotoViewController  alloc] init];
    
    veedaSharePhotoViewController.photo = image;
    
    [[self navigationController] pushViewController:veedaSharePhotoViewController animated:YES];
    
    // Compressing image, if necessary.
    //[self compressImageToBePosted];
    
    // Displaying image to be posted.
    //[self.photoToPost setImage:imageToBePosted];
    
    // Dismissing the editor
    //[self.navigationController popToViewController:veedaSharePhotoViewController animated:YES];
}

/**
 * Displays the CLImageEditor controller with the image given in input "image".
 *
 * @param image     Image to be passed to the controller for editing.
 * @return
 */
- (void)presentImageEditorWithImage:(UIImage*)image
{
    CLImageToolInfo *tool;
    CLImageEditor *editor;
    NSArray *ratios;
    
    // Creating editor
    editor = [[CLImageEditor alloc] initWithImage:image delegate:self];

    
    CLImageToolInfo *tool1 = [editor.toolInfo subToolInfoWithToolName:@"CLAdjustmentTool" recursive:NO];
    CLImageToolInfo *tool2 = [editor.toolInfo subToolInfoWithToolName:@"CLBlurTool" recursive:NO];
    CLImageToolInfo *tool3 = [editor.toolInfo subToolInfoWithToolName:@"CLRotateTool" recursive:NO];
    CLImageToolInfo *tool4 = [editor.toolInfo subToolInfoWithToolName:@"CLToneCurveTool" recursive:NO];
    
    tool1.available = NO;
    tool2.available = NO;
    tool3.available = NO;
    tool4.available = NO;
   
    
    // Putting Crop Tool up front in the menu
    tool = [editor.toolInfo subToolInfoWithToolName:@"CLClippingTool" recursive:NO];
    tool.dockedNumber = -1;
    ratios = @[@{@"value1":@1, @"value2":@1, @"titleFormat":@"%.1f : %.1f"},];
    tool.optionalInfo[@"ratios"] = ratios;
    tool.optionalInfo[@"swapButtonHidden"] = @YES;
    
    // Displaying image editor controller
    [self.navigationController pushViewController:editor animated:YES];
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
