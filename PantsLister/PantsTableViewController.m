//
// Created by amber on 1/22/13.
//


#import "PantsTableViewController.h"
#import "PantsTableViewCell.h"
#import "Pants.h"

@interface PantsTableViewController ()

@property (strong, nonatomic) NSArray *pants;

@end

@implementation PantsTableViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.pants count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Pants *pants = [self.pants objectAtIndex:indexPath.row];

    return [[PantsTableViewCell alloc] initWithType: pants.type];
}

@end