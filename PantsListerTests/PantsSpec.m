//
// Created by amber on 1/25/13.
//


#import "Kiwi.h"
#import "Pants.h"

SPEC_BEGIN(PantsSpec)

describe(@"Pants", ^{

    it(@"holds on to the type it is inited with", ^{
        NSString *type = @"the type!";

        Pants *pants = [[Pants alloc] initWithType:type];

        [[[pants type] should] equal:type];
    });

});

SPEC_END