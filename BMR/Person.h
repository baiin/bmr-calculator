//
//  Person.h
//  BMR
//
//  Created by Rj on 2/16/16.
//  Copyright © 2016 Rj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSNumber *height;
@property NSNumber *mass;
@property NSNumber *age;
@property NSString *sex;

+ (id) sharedPerson;

- (NSNumber*) getBMR;

@end
