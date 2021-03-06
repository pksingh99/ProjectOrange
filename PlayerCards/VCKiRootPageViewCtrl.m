//
//  VCKiRootPageViewCtrl.m
//  PlayerCards
//
//  Created by VenCKi on 10/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiRootPageViewCtrl.h"
#import "VCKiManualPagesViewCtrl.h"
#import "VCKiAppDelegate.h"
#import "VCKiApplicationState.h"

@interface VCKiRootPageViewCtrl ()

@end

@implementation VCKiRootPageViewCtrl

@synthesize allViewControllers = _allViewControllers;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

-(void) createViews
{
    self.allViewControllers = [[NSMutableArray alloc]initWithCapacity:2];
    VCKiManualPagesViewCtrl *page;
    
    VCKiAppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:appDelegate.storyBoardInUse bundle:[NSBundle mainBundle]];
    
    page = [storyBoard instantiateViewControllerWithIdentifier:@"VCKiManualPages"];
    page.pageIndex = [NSNumber numberWithInt:0];
    [self.allViewControllers addObject:page];
    
    page = [storyBoard instantiateViewControllerWithIdentifier:@"2ndManualPage"];
    page.pageIndex = [NSNumber numberWithInt:1];
    [self.allViewControllers addObject:page];
    
    /*for(int i=0; i<4; i++){
        page = [storyBoard instantiateViewControllerWithIdentifier:@"VCKiManualPages"];
        page.pageIndex = [NSNumber numberWithInt:i];
        [self.allViewControllers addObject:page];
    }*/
}

-(UIViewController *) pageViewController: (UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    VCKiManualPagesViewCtrl *vc = (VCKiManualPagesViewCtrl *)viewController;
    NSUInteger index = [vc.pageIndex integerValue];
    
    if(index == 1){
        return nil;
    }
    index = index + 1;
    
    return [self.allViewControllers objectAtIndex:index];
    
}

-(UIViewController *) pageViewController: (UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    VCKiManualPagesViewCtrl *vc = (VCKiManualPagesViewCtrl *)viewController;
    NSUInteger index = [vc.pageIndex integerValue];
    
    if(index == 0){
        return nil;
    }
    index = index - 1;
    
    return [self.allViewControllers objectAtIndex:index];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self createViews];
    VCKiApplicationState* state= [[VCKiApplicationState alloc]init];
    [state addValue:self :@"restAppScreen" ];
    self.dataSource = self;
    [self setViewControllers: [NSArray arrayWithObject:[self.allViewControllers objectAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:TRUE completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)resetAppHere
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
