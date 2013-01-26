//
// Created by amber on 1/25/13.
//


#import "PLPantsService.h"
#import "PLURLRequestProvider.h"
#import "AFJSONRequestOperation.h"
#import "PLPants.h"

@interface PLPantsService ()

@property (strong, nonatomic) PLURLRequestProvider *urlRequestProvider;

@end

@implementation PLPantsService

-(id)init {
    self= [super init];
    if (self) {
        self.urlRequestProvider = [[PLURLRequestProvider alloc] init];
    }
    return self;
}

- (void)getPantsWithSuccess:(void (^)(NSArray *))successBlock andFailure:(void (^)())failureBlock {
    NSURLRequest *request = [self.urlRequestProvider pantsRequest];

    AFJSONRequestOperation *operation = [AFJSONRequestOperation
            JSONRequestOperationWithRequest:request
                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSArray *json) {
                                        NSMutableArray *pantses = [[NSMutableArray alloc] init];
                                        [json enumerateObjectsUsingBlock:^(NSDictionary *pants, NSUInteger idx, BOOL *stop) {
                                            PLPants *aPants = [[PLPants alloc] initWithType:[pants valueForKey:@"type"]];
                                            [pantses addObject:aPants];
                                        }];

                                        successBlock([[NSArray alloc] initWithArray:pantses]);
                                    }
                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *requestError, id json) {
                                        failureBlock();
                                    }];
    [operation start];
}

@end