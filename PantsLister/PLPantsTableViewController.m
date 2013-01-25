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

    PLPantsTableViewCell *tableViewCell = [self getCell:tableView];
    [tableViewCell setType:pants.type];
    return tableViewCell;
}

- (PLPantsTableViewCell *)getCell:(UITableView *)tableView {
    PLPantsTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:PLPantsTableViewCellId];
    if (tableViewCell == nil) {
        tableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"PLPantsTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    return tableViewCell;
}

@end