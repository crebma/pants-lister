//
// Created by amber on 1/22/13.
//

#import "Kiwi.h"
#import "PantsTableViewController.h"
#import "Pants.h"
#import "PantsTableViewCell.h"

@interface PantsTableViewController ()

@property (strong, nonatomic) NSArray *pants;

@end

SPEC_BEGIN(PantsTableViewControllerSpec)

Pants *(^makePants)(NSString *) = ^(NSString *type) {
    return [[Pants alloc] initWithType:type];
};

NSIndexPath *(^rowInFirstSection)(int) = ^(int row) {
    return [NSIndexPath indexPathForRow:row inSection:0];
};

describe(@"PantsTableViewController", ^{

    __block PantsTableViewController *controller;

    beforeEach(^{
        controller = [[PantsTableViewController alloc] init];
    });

    it(@"is a UITableViewController", ^{
        [[controller should] beKindOfClass:[UITableViewController class]];
    });

    context(@"displaying pants", ^{

        it(@"has 5 rows if it has 5 pants...es", ^{
            NSArray *pants = @[[NSObject nullMock], [NSObject nullMock], [NSObject nullMock], [NSObject nullMock], [NSObject nullMock]];
            [controller stub:@selector(pants) andReturn:pants];

            NSInteger numberOfRows = [controller tableView:nil numberOfRowsInSection:0];

            [[theValue(numberOfRows) should] equal:theValue(5)];
        });

        it(@"should have one section", ^{
            NSInteger numberOfSections = [controller numberOfSectionsInTableView:nil];

            [[theValue(numberOfSections) should] equal:theValue(1)];
        });

        describe(@"should make a cell for each pants", ^{

            __block UITableViewCell *cell;

            beforeEach(^{
                cell = [PantsTableViewCell nullMock];
                [PantsTableViewCell stub:@selector(alloc) andReturn:cell];
                [cell stub:@selector(initWithType:) andReturn:cell];

                NSArray *pants = @[makePants(@"pajama"), makePants(@"jeggings"), makePants(@"jeans")];
                [controller stub:@selector(pants) andReturn:pants];
            });

            it(@"should make a pajamas row", ^{
                [[cell should] receive:@selector(initWithType:) withArguments:@"pajama"];

                UITableViewCell *actualCell = [controller tableView:nil cellForRowAtIndexPath:rowInFirstSection(0)];

                [[actualCell should] equal:cell];
            });

        });

    });

});

SPEC_END
