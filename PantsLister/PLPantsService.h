//
// Created by amber on 1/25/13.
//


#import <Foundation/Foundation.h>


@interface PLPantsService : NSObject

- (void)getPantsWithSuccess:(void (^)(NSArray *))successBlock andFailure:(void (^)())failureBlock;

@end