//
// Created by amber on 1/22/13.
//


#import "PantsTableViewController.h"

@interface PantsTableViewController ()

@property (strong, nonatomic) NSArray *pants;

@end

@implementation PantsTableViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.pants count];
}

@end