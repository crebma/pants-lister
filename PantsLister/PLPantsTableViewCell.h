//
//  PLPantsTableViewCell.h
//  PantsLister
//
//  Created by Amber Conville on 1/25/13.
//
//

#import <UIKit/UIKit.h>

@interface PLPantsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *pantsTypeLabel;

- (id)initWithType:(NSString *)type;

@end
