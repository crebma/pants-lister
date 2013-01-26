//
// Created by amber on 1/25/13.
//


#import "Kiwi.h"
#import "PLURLRequestProvider.h"

SPEC_BEGIN(PLURLRequestProviderSpec)

describe(@"PLURLRequestProvider", ^{

    it(@"should make a url that points to localhost:9393", ^{
        PLURLRequestProvider *provider = [[PLURLRequestProvider alloc] init];

        NSURLRequest *request = [provider pantsRequest];

        [[[[request URL] absoluteString] should] equal:@"http://localhost:9393"];
    });

});

SPEC_END
