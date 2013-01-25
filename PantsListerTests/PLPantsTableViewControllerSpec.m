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
@property (strong, nonatomic) PLPantsService *pantsService;

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

        describe(@"making a cell for each pants", ^{

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

    context(@"viewDidAppear", ^{

        __block id pantsService;

        beforeEach(^{
            pantsService = [PLPantsService nullMock];
            [controller stub:@selector(pantsService) andReturn:pantsService];
        });

        it(@"should get data from the service", ^{
            [[pantsService should] receive:@selector(getPantsWithSuccess:andFailure:)];

            [controller viewDidAppear:NO];
        });

        describe(@"the success callback", ^{

            __block void(^successBlock)(NSArray *);
            __block NSArray *pants;
            __block UITableView *tableView;

            beforeEach(^{
                tableView = [UITableView nullMock];
                [controller stub:@selector(tableView) andReturn:tableView];
                pants = @[makePants(@"pajama"), makePants(@"jeggings"), makePants(@"jeans")];
                KWCaptureSpy *spy = [pantsService captureArgument:@selector(getPantsWithSuccess:andFailure:) atIndex:0];

                [controller viewDidAppear:NO];

                successBlock = spy.argument;
            });

            it(@"sets the pants", ^{
                successBlock(pants);

                [[[controller pants] should] equal:pants];
            });

            it(@"reloads the data in the table view", ^{
                [[[controller tableView] should] receive:@selector(reloadData)];

                successBlock(pants);
            });

        });

        describe(@"the failure callback", ^{

            __block void(^failureBlock)(void);

            beforeEach(^{
                KWCaptureSpy *spy = [pantsService captureArgument:@selector(getPantsWithSuccess:andFailure:) atIndex:1];

                [controller viewDidAppear:NO];

                failureBlock = spy.argument;
            });

            it(@"makes and shows an alert view", ^{
                id alertView = [UIAlertView nullMock];
                [UIAlertView stub:@selector(alloc) andReturn:alertView];
                [alertView stub:@selector(initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:) andReturn:alertView];

                [[alertView should] receive:@selector(initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:) withArguments:@"Whoops!", @"No Pants!!", nil, @"Ok", nil];
                [[alertView should] receive:@selector(show)];

                failureBlock();
            });

        });


    });

});

SPEC_END
