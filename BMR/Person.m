//
//  Person.m
//  BMR
//
//  Created by Rj on 2/16/16.
//  Copyright © 2016 Rj. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (id)sharedPerson
{
    static Person *sharedMyPerson = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{sharedMyPerson = [[self alloc] init];});
    
    return sharedMyPerson;
}

- (id)init
{
    if (self = [super init])
    {
        self.height = [[NSNumber alloc] init];
        self.mass = [[NSNumber alloc] init];
        self.age = [[NSNumber alloc] init];
        self.sex = [[NSString alloc] init];
    }
    
    return self;
}

- (NSNumber*) getBMR
{
    NSNumber *result = @((13.397 * [self.mass floatValue]) + (4.799 * [self.height floatValue]) - (5.677 * [self.age floatValue]) + (88.362));
    
    return result;
}

@end
