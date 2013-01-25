//
// Created by amber on 1/25/13.
//


#import "Pants.h"


@implementation Pants

- (id)initWithType:(NSString *)type {
    self = [super init];
    if (self) {
        self.type = type;
    }
}

@end