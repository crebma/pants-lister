//
//  PantsTableViewCell.m
//  PantsLister
//
//  Created by Amber Conville on 1/25/13.
//
//

#import "PantsTableViewCell.h"

@implementation PantsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithType:(NSString *)type {
    return nil;
}

@end
