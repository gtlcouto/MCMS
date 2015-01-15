//
//  BattleViewController.m
//  MCMS
//
//  Created by Diego Cichello on 1/13/15.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import "BattleViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *miniPlayerOne;
@property (weak, nonatomic) IBOutlet UIImageView *miniPlayerTwo;
@property (weak, nonatomic) IBOutlet UIImageView *winnerPlayer;
@property (weak, nonatomic) IBOutlet UILabel *playerOneName;
@property AVQueuePlayer *myAudioPlayer;

@property SystemSoundID soundClick;

@property (weak, nonatomic) IBOutlet UILabel *playerTwoName;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];



    //start a background sound
    NSString *soundFilePath = @"/Users/gtlcouto/Mobile Makers/Week 2/MCMS/MCMS/Lina.mp3";
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    AVPlayerItem *item1 = [AVPlayerItem playerItemWithURL:fileURL];

    soundFilePath = @"/Users/gtlcouto/Mobile Makers/Week 2/MCMS/MCMS/Versus.mp3";
    fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    AVPlayerItem *item2 = [AVPlayerItem playerItemWithURL:fileURL];


    soundFilePath = @"/Users/gtlcouto/Mobile Makers/Week 2/MCMS/MCMS/Centaur.mp3";
    fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    AVPlayerItem *item3 = [AVPlayerItem playerItemWithURL:fileURL];


    soundFilePath = @"/Users/gtlcouto/Mobile Makers/Week 2/MCMS/MCMS/Winner.mp3";
    fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    AVPlayerItem *item4 = [AVPlayerItem playerItemWithURL:fileURL];

    soundFilePath = @"/Users/gtlcouto/Mobile Makers/Week 2/MCMS/MCMS/KevinSux.mp3";
    fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath ];
    AVPlayerItem *item5 = [AVPlayerItem playerItemWithURL:fileURL];
    self.myAudioPlayer = [[AVQueuePlayer alloc] initWithItems:@[item1, item2, item3, item4, item5]];
    [self.myAudioPlayer play];



    self.winnerPlayer.alpha=0.0;
    self.miniPlayerTwo.center = CGPointMake(-20, 20);
    self.miniPlayerOne.center = CGPointMake(250,20);
    self.playerOneName.alpha =0.0;
    self.playerTwoName.alpha =0.0;

    self.playerOneName.text = @"Lina";
    self.playerTwoName.text = @"Centaur";
    


    self.miniPlayerOne.image = [UIImage imageNamed:@"Centaur.png"];
    self.miniPlayerTwo.image = [UIImage imageNamed:@"Lina.png"];
    self.winnerPlayer.image = [UIImage imageNamed:@"kevin.png"];

    


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

    [UIView animateWithDuration:5.0 delay:6.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
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
