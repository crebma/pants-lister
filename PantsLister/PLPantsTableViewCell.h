//
//  PLPantsTableViewCell.h
//  PantsLister
//
//  Created by Amber Conville on 1/25/13.
//
//

#import <UIKit/UIKit.h>

#define PLPantsTableViewCellId @"PLPantsTableViewCellId"

@interface PLPantsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *pantsTypeLabel;

- (void)setType:(NSString *)pantsType;

@end
