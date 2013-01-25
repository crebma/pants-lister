//
// Created by amber on 1/22/13.
//

#import "Kiwi.h"
#import "PLPantsTableViewController.h"
#import "PLPants.h"
#import "PLPantsTableViewCell.h"
#import "PLPantsService.h"

@interface PLPantsTableViewController ()

@property (strong, nonatomic) NSArray *pants;

@end

SPEC_BEGIN(PLPantsTableViewControllerSpec)

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

        describe(@"should make a cell for each pants", ^{

            __block PLPantsTableViewCell *cell;
            __block UITableView *tableView;

            beforeEach(^{
                NSArray *pants = @[makePants(@"pajama"), makePants(@"jeggings"), makePants(@"jeans")];
                [controller stub:@selector(pants) andReturn:pants];

                cell = [PLPantsTableViewCell nullMock];
                [PLPantsTableViewCell stub:@selector(alloc) andReturn:cell];
                [cell stub:@selector(initWithType:) andReturn:cell];

                tableView = [UITableView nullMock];
                [tableView stub:@selector(dequeueReusableCellWithIdentifier:) andReturn:cell];
            });

            it(@"should dequeue a reusable cell!", ^{
                [[tableView should] receive:@selector(dequeueReusableCellWithIdentifier:) withArguments:PLPantsTableViewCellId];

                [controller tableView:tableView cellForRowAtIndexPath:rowInFirstSection(0)];
            });

            it(@"should return the reusable cell!", ^{
                UITableViewCell *actualCell = [controller tableView:tableView cellForRowAtIndexPath:rowInFirstSection(0)];

                [[actualCell should] equal:cell];
            });

            it(@"should make a pajamas row", ^{
                [[cell should] receive:@selector(setType:) withArguments:@"pajama"];

                [controller tableView:tableView cellForRowAtIndexPath:rowInFirstSection(0)];
            });

            it(@"should make a jeggings row", ^{
                [[cell should] receive:@selector(setType:) withArguments:@"jeggings"];

                [controller tableView:tableView cellForRowAtIndexPath:rowInFirstSection(1)];
            });

            it(@"should make a jeans row", ^{
                [[cell should] receive:@selector(setType:) withArguments:@"jeans"];

                [controller tableView:tableView cellForRowAtIndexPath:rowInFirstSection(2)];
            });

            it(@"should make a new row if there is none to dequeue", ^{
                [tableView stub:@selector(dequeueReusableCellWithIdentifier:) andReturn:nil];

                UITableViewCell *actualCell = [controller tableView:tableView cellForRowAtIndexPath:rowInFirstSection(2)];

                [[actualCell should] beNonNil];
            });

        });

    });

    pending(@"should get data on viewDidAppear", ^{

        it(@"should get data from the service", ^{
            id pantsService = [PLPantsService nullMock];
            [controller stub:@selector(pantsService) andReturn:pantsService];

            [controller viewDidAppear:NO];

            [[pantsService should] receive:@selector(getPantsWithSuccess:andFailure:)];
        });

    });

});

SPEC_END
