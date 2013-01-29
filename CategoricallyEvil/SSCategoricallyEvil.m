//
//  CategoricallyEvil.m
//  CategoricallyEvil
//
//  Created by Matthew Mondok on 1/28/13.
//  Copyright (c) 2013 Edentech. All rights reserved.
//

#import "SSCategoricallyEvil.h"

@implementation NSObject(Swazzle)

-(void) swizzleMe:(SEL) orig withMethod:(SEL) new{
  Method origMethod = class_getInstanceMethod(self.class, orig);
  Method newMethod = class_getInstanceMethod(self.class, new);
  if(class_addMethod(self.class, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
    class_replaceMethod(self.class, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
  else
    method_exchangeImplementations(origMethod, newMethod);
}

@end