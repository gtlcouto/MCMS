//
//  MagicalCreature.h
//  MCMS
//
//  Created by Gustavo Couto on 2015-01-13.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//
@class UIImage;
#import "Accessories.h"
#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject
@property NSString * creatureName;
@property NSString * detail;
@property NSMutableArray *accessory;
@property UIImage * creatureImage;

-(instancetype)initWithName:(NSString *)name aDetail:(NSString *)detail anAccessory:(NSMutableArray*)accessory aCreatureImage:(UIImage *)image;

-(instancetype)initWithName:(NSString *)name aDetail:(NSString *)detail anAccessory:(NSMutableArray*)accessory;

-(instancetype)initWithName:(NSString *)name aDetail:(NSString *)detail;

-(instancetype)initWithName:(NSString *)name;

@end

