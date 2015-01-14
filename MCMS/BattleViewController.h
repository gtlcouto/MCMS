//
//  BattleViewController.h
//  MCMS
//
//  Created by Diego Cichello on 1/13/15.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagicalCreature.h"

@interface BattleViewController : UIViewController

@property MagicalCreature *winningCreature;
@property MagicalCreature *losingCreature;

@end
