//
// Created by amber on 1/25/13.
//

#import "Kiwi.h"
#import "PLPantsTableViewCell.h"

SPEC_BEGIN(PantsTableViewCellSpec)

PLPantsTableViewCellSpec

PLPantsTableViewCellSpec

describe(@"PantsTableView", ^{

    it(@"should set the label text to the type it is inited with", ^{
        PLPantsTableViewCell *cell = [[PLPantsTableViewCell alloc] init];
        id label = [UILabel nullMock];
        [cell stub:@selector(pantsTypeLabel) andReturn:label];
        NSString *type = @"a type";

        [[label should] receive:@selector(setText:) withArguments:type];

        [cell initWithType:type];
    });

});

SPEC_END