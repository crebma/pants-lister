//
// Created by amber on 1/22/13.
//


#import "PLPantsTableViewController.h"
#import "PLPantsTableViewCell.h"
#import "PLPants.h"
#import "PLPantsService.h"

@interface PLPantsTableViewController ()

@property (strong, nonatomic) NSArray *pants;
@property (strong, nonatomic) PLPantsService *pantsService;

@end

@implementation PLPantsTableViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.pantsService = [[PLPantsService alloc] init];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated {
    [self.pantsService getPantsWithSuccess:^(NSArray *pants){
        self.pants = pants;
        [self.tableView reloadData];
    } andFailure:^{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Whoops!" message:@"No Pants!!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }];
}

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