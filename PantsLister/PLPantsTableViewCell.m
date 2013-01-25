//
//  PLPantsTableViewCell.m
//  PantsLister
//
//  Created by Amber Conville on 1/25/13.
//
//

#import "PLPantsTableViewCell.h"

@implementation PLPantsTableViewCell

- (id)initWithType:(NSString *)type {
    self = [super init];
    if (self) {
        [self.pantsTypeLabel setText:type];
    }
    return self;
}

@end
