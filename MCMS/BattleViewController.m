//
//  BattleViewController.m
//  MCMS
//
//  Created by Diego Cichello on 1/13/15.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import "BattleViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *miniPlayerOne;
@property (weak, nonatomic) IBOutlet UIImageView *miniPlayerTwo;
@property (weak, nonatomic) IBOutlet UIImageView *winnerPlayer;
@property (weak, nonatomic) IBOutlet UILabel *playerOneName;

@property SystemSoundID soundClick;

@property (weak, nonatomic) IBOutlet UILabel *playerTwoName;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    NSURL *clickSound   = [NSURL fileURLWithPath:@"/Users/diegocichello/Downloads/Centaur.mp3"];

    AudioServicesCreateSystemSoundID (CFBridgingRetain(clickSound), self.soundClick);

    NSLog(clickSound);

    AudioServicesPlaySystemSound(self.soundClick);




    self.winnerPlayer.alpha=0.0;
    self.miniPlayerTwo.center = CGPointMake(-20, 20);
    self.miniPlayerOne.center = CGPointMake(250,20);
    self.playerOneName.alpha =0.0;
    self.playerTwoName.alpha =0.0;

    self.playerOneName.text = self.losingCreature.creatureName;
    self.playerTwoName.text = self.winningCreature.creatureName;
    


    self.miniPlayerOne.image = [UIImage imageNamed:self.winningCreature.creatureName];
    self.miniPlayerTwo.image = [UIImage imageNamed:self.losingCreature.creatureName];
    self.winnerPlayer.image = [UIImage imageNamed:self.winningCreature.creatureName];

    


    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.miniPlayerTwo.center = CGPointMake(100, 20);
        self.miniPlayerOne.center = CGPointMake(100, 20);
        AudioServicesPlaySystemSound(self.soundClick);


    } completion:^(BOOL finished) {

    }];


    [UIView animateWithDuration:2.0 delay:1.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.playerOneName.alpha=1.0;
        self.playerTwoName.alpha=1.0;
    } completion:^(BOOL finished) {

    }];

    [UIView animateWithDuration:5.0 delay:2.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.winnerPlayer.alpha =1.0;
    } completion:^(BOOL finished) {

    }];






    
}

- (void)fadeImageOne
{
    [UIView beginAnimations:@"minione" context:nil];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationDuration:2.0];

    self.miniPlayerOne.alpha = 1.0;
    [UIView commitAnimations];







    
}

- (void) fadeImageTwo
{
    [UIView beginAnimations:@"minetwo" context:nil];
    [UIView setAnimationDelay:2.0];
    [UIView setAnimationDuration:4.0];
    self.miniPlayerTwo.alpha = 1.0;
    [UIView commitAnimations];

}

- (void) fadeImageThree
{
    [UIView beginAnimations:@"winner" context:nil];
    [UIView setAnimationDelay:5.0];
    [UIView setAnimationDuration:8.0];
    self.winnerPlayer.alpha = 1.0;
    [UIView commitAnimations];
}



@end
