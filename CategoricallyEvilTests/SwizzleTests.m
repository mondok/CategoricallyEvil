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

- (void)testBasicSwizzle
{
  DummyObject *dummy = [[DummyObject alloc] init];
  
  NSString *result1 = [dummy runOnce];
  
  [dummy swizzleMe:@selector(runOnce) withMethod:@selector(runTwice)];
  
  NSString *result2 = [dummy runOnce];
  
  NSString *result3 = [dummy runTwice];
  
  STAssertFalse([result1 isEqualToString:result2], @"Same method called twice, two different results");
  
  STAssertEquals(result1, result3, @"Different method, same strings");
}

-(void)testEvilSwizzle{
  NSString *basicString = @"I'm a string";
  NSString *upperVersion = @"I'M A STRING";
  NSString *lowerVersion = @"i'm a string";
  
  [basicString swizzleMe:@selector(uppercaseString) withMethod:@selector(lowercaseString)];
  
  NSString *result1 = [basicString uppercaseString];
  NSString *result2 = [basicString lowercaseString];
  
  NSLog(@"result1 is %@", result1);
  NSLog(@"result2 is %@", result2);
  
  STAssertTrue([lowerVersion isEqualToString:result1], @"Upper equals lower?");
  STAssertTrue([upperVersion isEqualToString:result2], @"Dogs and cats, living together, mass hysteria");
}

@end
