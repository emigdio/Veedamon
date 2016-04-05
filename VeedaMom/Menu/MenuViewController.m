
/*

 Copyright (c) 2013 Joan Lluch <joan.lluch@sweetwilliamsl.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 Original code:
 Copyright (c) 2011, Philip Kluz (Philip.Kluz@zuui.org)
 
*/

#import "MenuViewController.h"

#import "SWRevealViewController.h"

#import "VeedaSignInViewController.h"

#import "AppDelegate.h"


@interface MenuViewController()
{
    NSArray * menuArray;
    
}
@end

@implementation MenuViewController

@synthesize menuTableView = _menuTableView;

#pragma mark - View lifecycle


- (void)viewDidLoad
{
	[super viewDidLoad];

   /* NSArray * version = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
    if ([[version objectAtIndex:0] intValue] >= 7) {
        self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    } else {
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    }*/
    
     [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    self.navigationController.navigationBar.translucent = NO;
    
    menuArray = [[NSArray alloc] initWithObjects:@"Configuración",@"Servicio de Ayuda", @"Términos y condiciones", @"Safety Plan", @"Cerrar sesión", @"Tu embarazo", nil];
    
 

}

#pragma marl - UITableView Data Source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     return 42;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [menuArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"MenuCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    
    int anchoTotal = self.menuTableView.frame.size.width;
    
    if ([indexPath row] == 5){
        
        CGRect labelFrame;
        labelFrame.origin.x = (260 - 120)/2;
        labelFrame.origin.y = 58;
        labelFrame.size.width = 120;
        labelFrame.size.height = 20;
        
        UILabel * label = [[UILabel alloc] initWithFrame:labelFrame];
        [label setText:@"Tu embarazo"];
        [label setFont:[UIFont systemFontOfSize:20]];
        [label setTextColor:[UIColor whiteColor]];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setNumberOfLines:1];
        
        CGRect labelFrame2;
        labelFrame2.origin.x = (260 - 80)/2;
        labelFrame2.origin.y = 170;
        labelFrame2.size.width = 85;
        labelFrame2.size.height = 20;
        
        UILabel * label2 = [[UILabel alloc] initWithFrame:labelFrame2];
        [label2 setText:@"Semana 9"];
        [label2 setFont:[UIFont systemFontOfSize:18]];
        [label2 setTextColor:[UIColor whiteColor]];
        [label2 setBackgroundColor:[UIColor clearColor]];
        [label2 setNumberOfLines:1];
        
        CGFloat margenleft = (anchoTotal - 60 - 90)/2;
        CGFloat margenTop = 80;
        UIImageView *logo = [[UIImageView alloc]initWithFrame:CGRectMake(margenleft,margenTop, 90, 90)];
        logo.image=[UIImage imageNamed:@"logoBebe.png"];
        [cell addSubview:logo];
        [cell addSubview:label];
        [cell addSubview:label2];
        cell.backgroundColor = [UIColor clearColor];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        
    }else{
        
        
    CGFloat heightForRow = [self tableView:tableView heightForRowAtIndexPath:indexPath];
    CGFloat widthForRow = 260;
    
    CGRect subviewFrame;
    subviewFrame.origin.x = 20;
    subviewFrame.origin.y = 5;
    subviewFrame.size.width = widthForRow - 40;
    subviewFrame.size.height = heightForRow;
    
    UIView * subview = [[UIView alloc] initWithFrame:subviewFrame];
    [subview setBackgroundColor:[UIColor clearColor]];
    
    NSString * alert = [menuArray objectAtIndex:indexPath.row];
    
    CGRect labelFrame;
    labelFrame.origin.x = 0;
    labelFrame.origin.y = (heightForRow - subviewFrame.size.height + 14)/2;
    labelFrame.size.width = subviewFrame.size.width;
    labelFrame.size.height = subviewFrame.size.height - 14;
    
    UILabel * label = [[UILabel alloc] initWithFrame:labelFrame];
    [label setText:alert];
    [label setFont:[UIFont systemFontOfSize:16]];
    [label setTextColor:[UIColor whiteColor]];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setNumberOfLines:1];
        
    CGRect imageArrowFrame;
    imageArrowFrame.origin.x = 200;
    imageArrowFrame.origin.y = (heightForRow - 20)/2;
    imageArrowFrame.size.width = 10;
    imageArrowFrame.size.height = 20;
        
    UIImageView *imageArrow = [[UIImageView alloc]initWithFrame:imageArrowFrame];
    imageArrow.image = [UIImage imageNamed:@"arrowRight.png"];
        
    CGRect imageSeparatorFrame;
    imageSeparatorFrame.origin.x = -10;
    imageSeparatorFrame.origin.y = heightForRow;
    imageSeparatorFrame.size.width = widthForRow;
    imageSeparatorFrame.size.height = 2.5;
        
    UIImageView *imageSeparator = [[UIImageView alloc]initWithFrame:imageSeparatorFrame];
    imageSeparator.image = [UIImage imageNamed:@"separator.png"];
    
    [subview addSubview:label];
    [subview addSubview:imageArrow];
    [subview addSubview:imageSeparator];

    
    [cell addSubview:subview];
    cell.backgroundColor = [UIColor clearColor];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
    
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRevealViewController * revealController = self.revealViewController;
    
    UINavigationController * frontNavigationController = (id)revealController.frontViewController;
    
    NSInteger row = indexPath.row;
    
	if (row == 0) {
            
            
       
       
        
    } else if (row == 1) {
        
      
            
    
        
	} else if (row == 2) {
        
     
        
	} else if (row == 3) {
        
    
       

    } else if (row == 4) {
        
        
        if ( ![frontNavigationController.topViewController isKindOfClass:[VeedaSignInViewController class]] ) {
            
             VeedaSignInViewController *veedaSignInViewController = [[VeedaSignInViewController alloc] init];
            
            UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:veedaSignInViewController];
            
            [revealController setFrontViewController:navigationController animated:YES];
            
        } else {
            
            [revealController revealToggle:self];
            
            [frontNavigationController.topViewController reloadInputViews ];
        }
   
        
    }else if (row == 5) {
        
     
        
    }else if (row == 6) {
        
   
     
    }else if (row == 7) {
       
        
    }else if (row == 8) {
        
 
        
    }}



- (void) hideMenu
{
    SWRevealViewController * revealController = self.revealViewController;

    [revealController revealToggle:self];
}



@end