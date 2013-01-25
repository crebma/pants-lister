//
//  PLPantsTableViewCell.m
//  PantsLister
//
//  Created by Amber Conville on 1/25/13.
//
//

#import "PLPantsTableViewCell.h"

@implementation PLPantsTableViewCell

- (void)setType:(NSString *) pantsType {
    self.pantsTypeLabel.text = pantsType;
}

@end
