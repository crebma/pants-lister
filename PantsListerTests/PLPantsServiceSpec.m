//
// Created by amber on 1/25/13.
//


#import "Kiwi.h"
#import "PLPantsService.h"
#import "PLURLRequestProvider.h"
#import "AFJSONRequestOperation.h"
#import "OHHTTPStubsResponse.h"
#import "OHHTTPStubs.h"

@interface PLPantsService ()

@property (strong, nonatomic) PLURLRequestProvider *urlRequestProvider;

@end

SPEC_BEGIN(PLPantsServiceSpec)

describe(@"PLPantsService", ^{

    __block PLPantsService *service;
    __block PLURLRequestProvider *provider;

    beforeEach(^{
        service = [[PLPantsService alloc] init];
        provider = [PLURLRequestProvider nullMock];
        [service stub:@selector(urlRequestProvider) andReturn:provider];
    });

    it(@"uses the request urlRequestProvider to make a request", ^{
        [[provider should] receive:@selector(pantsRequest)];

        [service getPantsWithSuccess:nil andFailure:nil];
    });

    //I am punting on testing AFNetworking, because it wants me to do some integration test BS. Might as well test manually. :(

});

SPEC_END