//
// Created by amber on 1/25/13.
//


#import "PLURLRequestProvider.h"


@implementation PLURLRequestProvider

- (NSURLRequest *)pantsRequest {
    return [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost:9393"]];
}

@end