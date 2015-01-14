//
//  CreatureViewController.h
//  MCMS
//
//  Created by Diego Cichello on 1/13/15.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagicalCreature.h"

@interface CreatureViewController : UIViewController
@property MagicalCreature *magicalCreature;
@property NSMutableArray *creatures;
@property int indexPath;

@end
