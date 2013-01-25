//
// Created by amber on 1/25/13.
//


#import "Kiwi.h"
#import "PLPants.h"

SPEC_BEGIN(PantsSpec)

PLPantsSpec

PLPantsSpec

describe(@"PLPants", ^{

    it(@"holds on to the type it is inited with", ^{
        NSString *type = @"the type!";

        PLPants *pants = [[PLPants alloc] initWithType:type];

        [[[pants type] should] equal:type];
    });

});

SPEC_END