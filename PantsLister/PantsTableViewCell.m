//
//  PantsTableViewCell.m
//  PantsLister
//
//  Created by Amber Conville on 1/25/13.
//
//

#import "PantsTableViewCell.h"

@implementation PantsTableViewCell

- (id)initWithType:(NSString *)type {
    self = [super init];
    if (self) {
        [self.pantsTypeLabel setText:type];
    }
    return self;
}

@end
