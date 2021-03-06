//
//  VCKiSeondarySquatViewController.m
//  PlayerCards
//
//  Created by VenCKi on 11/9/13.
//  Copyright (c) 2013 VenCKi. All rights reserved.
//

#import "VCKiSeondarySquatViewController.h"
#import "VCKiPlayerRecordReader.h"

@interface VCKiSeondarySquatViewController ()

@end

@implementation VCKiSeondarySquatViewController

@synthesize tableView = _tableView;
VCKiPlayerRecordReader* playerManager;
NSMutableArray* _playersList;

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
	_tableView.delegate = self;
    _tableView.dataSource = self;
    _playersList = [[NSMutableArray alloc]init];
    
    playerManager = [[VCKiPlayerRecordReader alloc]init];
    
    VCKiPlayerEntity *player = [playerManager getNextSecondaryPlayer];
    int i=1;
    
    while (player && i <= playerManager.oppositionSquadCount){
        i=i+1;
        [_playersList addObject:player];
        player = [playerManager getNextSecondaryPlayer];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_playersList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"playerRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    VCKiPlayerEntity* player = [_playersList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = player.fullName;
    cell.detailTextLabel.text = player.team;
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",player.fullName]];
    if (!cell.imageView.image) {
        cell.imageView.image =[UIImage imageNamed:@"avatar.jpg"];
    }
    cell.imageView.layer.cornerRadius = 10;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
