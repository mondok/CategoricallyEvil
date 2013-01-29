//
//  CategoricallyEvilTests.m
//  CategoricallyEvilTests
//
//  Created by Matthew Mondok on 1/28/13.
//  Copyright (c) 2013 Edentech. All rights reserved.
//

#import "SwizzleTests.h"
#import "SSCategoricallyEvil.h"

@interface DummyObject : NSObject
-(NSString *) runOnce;
-(NSString *) runTwice;
@end

@implementation DummyObject : NSObject
-(NSString *) runOnce{
  return @"once";
}

-(NSString *) runTwice{
  return @"twice";
}
@end


@implementation SwizzleTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testSwizzle
{
  DummyObject *dummy = [[DummyObject alloc] init];
  
  NSString *result1 = [dummy runOnce];
  
  [dummy swizzleMe:@selector(runOnce) andNewMethod:@selector(runTwice)];
  
  NSString *result2 = [dummy runOnce];
  
  NSString *result3 = [dummy runTwice];
  
  STAssertFalse([result1 isEqualToString:result2], @"Same method called twice, two different results");
  
  STAssertEquals(result1, result3, @"Different method, same strings");
  
}

@end
