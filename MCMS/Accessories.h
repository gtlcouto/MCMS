//
//  Accessories.h
//  MCMS
//
//  Created by Gustavo Couto on 2015-01-13.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Accessories : NSObject
@property NSString * name;
@property int power;
@property BOOL isEquiped;

-(instancetype)initWithName:(NSString *)name;
-(instancetype)initWithName:(NSString* )name aPower:(int)power;
-(instancetype)initWithName:(NSString* )name aPower:(int)power isEquiped:(BOOL)isEquiped;

@end
