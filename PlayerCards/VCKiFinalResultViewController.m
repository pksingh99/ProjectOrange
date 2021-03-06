//
//  VCKiFinalResultViewController.m
//  PlayerCards
//
//  Created by VenCKi on 11/14/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiFinalResultViewController.h"
#import "VCKiApplicationState.h"
#import "VCKiRootPageViewCtrl.h"

@interface VCKiFinalResultViewController ()

@end

@implementation VCKiFinalResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    if (self.isPrimaryPlayerWon) {
        self.finalResultMessage.text = @"Congratulations, Excellent game. You are a stats champ!";
        [self.winnerImage setHidden: NO];
        [self.looserImage setHidden: YES];
    }
    else
    {
        self.finalResultMessage.text = @"Game Over. You should try again. Hope you enjoyed the game!";
        [self.winnerImage setHidden: YES];
        [self.looserImage setHidden: NO];
    }
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playAgainClicked:(id)sender {
    VCKiApplicationState* state = [[VCKiApplicationState alloc]init];
    VCKiRootPageViewCtrl* ctrl = (VCKiRootPageViewCtrl* )[state getValueForKey:@"restAppScreen"];
    [ctrl resetAppHere];
}
@end
