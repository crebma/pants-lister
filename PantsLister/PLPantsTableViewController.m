//
// Created by amber on 1/22/13.
//


#import "PLPantsTableViewController.h"
#import "PLPantsTableViewCell.h"
#import "PLPants.h"

@interface PLPantsTableViewController ()

@property (strong, nonatomic) NSArray *pants;

@end

@implementation PLPantsTableViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.pants count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PLPants *pants = [self.pants objectAtIndex:indexPath.row];

    return [[PLPantsTableViewCell alloc] initWithType: pants.type];
}

@end