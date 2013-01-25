//
// Created by amber on 1/25/13.
//


#import "PLPants.h"


@implementation PLPants

- (id)initWithType:(NSString *)type {
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

@end