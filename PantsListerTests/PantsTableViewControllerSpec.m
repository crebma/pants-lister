//
// Created by amber on 1/22/13.
//

#import "Kiwi.h"
#import "PantsTableViewController.h"

SPEC_BEGIN(PantsTableViewControllerSpec)

describe(@"PantsTableViewController", ^{

    it(@"is a UITableViewController", ^{
        PantsTableViewController *controller = [[PantsTableViewController alloc] init];

        [[controller should] beKindOfClass:[UITableViewController class]];
    });

});

SPEC_END
