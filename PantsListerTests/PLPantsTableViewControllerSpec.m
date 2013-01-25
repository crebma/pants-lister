//
// Created by amber on 1/22/13.
//

#import "Kiwi.h"
#import "PLPantsTableViewController.h"
#import "PLPants.h"
#import "PLPantsTableViewCell.h"

@interface PLPantsTableViewController ()

@property (strong, nonatomic) NSArray *pants;

@end

SPEC_BEGIN(PantsTableViewControllerSpec)

PLPantsTableViewControllerSpec

PLPantsTableViewControllerSpec

PLPants *(^makePants)(NSString *) = ^(NSString *type) {
    return [[PLPants alloc] initWithType:type];
};

NSIndexPath *(^rowInFirstSection)(int) = ^(int row) {
    return [NSIndexPath indexPathForRow:row inSection:0];
};

describe(@"PLPantsTableViewController", ^{

    __block PLPantsTableViewController *controller;

    beforeEach(^{
        controller = [[PLPantsTableViewController alloc] init];
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

        pending(@"should make a cell for each pants", ^{

            __block PLPantsTableViewCell *cell;

            beforeEach(^{
                NSArray *pants = @[makePants(@"pajama"), makePants(@"jeggings"), makePants(@"jeans")];
                [controller stub:@selector(pants) andReturn:pants];

                cell = [PLPantsTableViewCell nullMock];
                [PLPantsTableViewCell stub:@selector(alloc) andReturn:cell];
                [cell stub:@selector(initWithType:) andReturn:cell];
            });

            it(@"should make a pajamas row", ^{
                [[cell should] receive:@selector(initWithType:) withArguments:@"pajama"];

                [controller tableView:nil cellForRowAtIndexPath:rowInFirstSection(0)];
            });

            it(@"should make a jeggings row", ^{
                [[cell should] receive:@selector(initWithType:) withArguments:@"jeggings"];

                [controller tableView:nil cellForRowAtIndexPath:rowInFirstSection(1)];
            });

            it(@"should make a jeans row", ^{
                [[cell should] receive:@selector(initWithType:) withArguments:@"jeans"];

                [controller tableView:nil cellForRowAtIndexPath:rowInFirstSection(2)];
            });

        });

    });

});

SPEC_END
