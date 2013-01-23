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

    context(@"displaying pants", ^{

        it(@"has 5 rows if it has 5 pants...es", ^{
            PantsTableViewController *controller = [[PantsTableViewController alloc] init];
            NSArray *pants = @[[NSObject nullMock], [NSObject nullMock], [NSObject nullMock], [NSObject nullMock], [NSObject nullMock]];
            [controller stub:@selector(pants) andReturn:pants];

            NSInteger numberOfRows = [controller tableView:nil numberOfRowsInSection:0];

            [[theValue(numberOfRows) should] equal:theValue(5)];
        });

    });

});

SPEC_END
