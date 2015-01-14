//
//  Accessories.m
//  MCMS
//
//  Created by Gustavo Couto on 2015-01-13.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import "Accessories.h"

@implementation Accessories


-(instancetype)init
{
        self = [super init];
        if (self)
            {
                    return[self initWithName:nil];
                }
        return self;
}

-(instancetype)initWithName:(NSString *)name
{
        self = [super init];
        if (self)
            {
                    return[self initWithName:name aPower:0];
                }
        return self;
}
-(instancetype)initWithName:(NSString* )name aPower:(int)power
{
        self = [super init];
        if (self)
            {
                    return[self initWithName:name aPower:power isEquiped:false];
                }
        return self;

}

-(instancetype)initWithName:(NSString* )name aPower:(int)power isEquiped:(BOOL)isEquiped
{
        self = [super init];
        if (self)
            {
                    self.name = name;
                    self.power = power;
                    self.isEquiped = isEquiped;
                }
        return self;
        
}



@end
