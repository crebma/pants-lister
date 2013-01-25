//
// Created by amber on 1/25/13.
//

#import "Kiwi.h"
#import "PLPantsTableViewCell.h"

SPEC_BEGIN(PLPantsTableViewCellSpec)

describe(@"PantsTableView", ^{

    it(@"should set the label text to the type that is set", ^{
        PLPantsTableViewCell *cell = [[PLPantsTableViewCell alloc] init];
        id label = [UILabel nullMock];
        [cell stub:@selector(pantsTypeLabel) andReturn:label];
        NSString *type = @"a type";

        [[label should] receive:@selector(setText:) withArguments:type];

        [cell setType:type];
    });

});

SPEC_END