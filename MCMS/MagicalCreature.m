//
//  MagicalCreature.m
//  MCMS
//
//  Created by Gustavo Couto on 2015-01-13.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

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
        return[self initWithName:name aDetail:nil];
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name aDetail:(NSString *)detail
{
    self = [super init];
    if (self)
    {
        return[self initWithName:name aDetail:detail anAccessory:nil];
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name aDetail:(NSString *)detail anAccessory:(Accessories *)accessory
{
    self = [super init];
    if (self)
    {
        return[self initWithName:name aDetail:detail anAccessory:accessory aCreatureImage:nil];
    }
    return self;
}


-(instancetype)initWithName:(NSString *)name aDetail:(NSString *)detail anAccessory:(Accessories*)accessory aCreatureImage:(UIImage *)image
{
    self = [super init];
    if (self)
    {
        self.creatureName = name;
        self.detail = detail;
        self.accessory = accessory;
        self.creatureImage = image;
    }
    return self;
}

@end
