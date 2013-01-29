//
//  CategoricallyEvil.h
//  CategoricallyEvil
//
//  Created by Matthew Mondok on 1/28/13.
//  Copyright (c) 2013 Edentech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import </usr/include/objc/objc-class.h>

@interface NSObject(Swazzle)
-(void) swizzleMe:(SEL) orig andNewMethod:(SEL) new;
@end

