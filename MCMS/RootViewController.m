//
//  ViewController.m
//  MCMS
//
//  Created by Gustavo Couto on 2015-01-13.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
#import "Accessories.h"
#import "BattleViewController.h"

@interface RootViewController () <UITableViewDataSource,UITableViewDelegate>
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property MagicalCreature *currentCreature;
@property BOOL isEditButtonPressed;
@property NSMutableArray *accessoriesArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.accessoriesArray = [[NSMutableArray alloc]init];
    [self generateAccessories];

    MagicalCreature *jakiro = [[MagicalCreature alloc]initWithName:@"Jakiro" aDetail:@"Awesome Dragon" anAccessory:self.accessoriesArray];
    MagicalCreature *luna = [[MagicalCreature alloc]initWithName:@"Luna" aDetail:@"Badass tiger rider with glaives" anAccessory:self.accessoriesArray];
    MagicalCreature *mirana = [[MagicalCreature alloc]initWithName:@"Mirana" aDetail:@"Arrow shooting girl" anAccessory:self.accessoriesArray];
    MagicalCreature *abaddon = [[MagicalCreature alloc]initWithName:@"Abaddon" aDetail:@"Undead Knight " anAccessory:self.accessoriesArray];
    MagicalCreature *lina = [[MagicalCreature alloc]initWithName:@"Lina" aDetail:@"Fire-casting Witch" anAccessory:self.accessoriesArray];
    MagicalCreature *natureProphet = [[MagicalCreature alloc]initWithName:@"Nature Prophet" aDetail:@"Nature Protector" anAccessory:self.accessoriesArray];
    MagicalCreature *centaur = [[MagicalCreature alloc]initWithName:@"Centaur" aDetail:@"Half-horse, Half-Ownage" anAccessory:self.accessoriesArray];
    MagicalCreature *crystalMaiden = [[MagicalCreature alloc]initWithName:@"Crystal Maiden" aDetail:@"Teleporting Cold Witch" anAccessory:self.accessoriesArray];
    

    self.creatures = [NSMutableArray arrayWithObjects:jakiro,luna,mirana,abaddon,lina,natureProphet,centaur,crystalMaiden, nil];
    
    
}
- (IBAction)onBattleButtonPressed:(UIBarButtonItem *)sender {
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MCMSCell"];

    MagicalCreature *magicalCreature =  [self.creatures objectAtIndex:indexPath.row];

    cell.textLabel.text = magicalCreature.creatureName;
    
    cell.imageView.image = [self resizeImage:[UIImage imageNamed:magicalCreature.creatureName] imageSize:CGSizeMake(70, 70)];


    return cell;
}

- (IBAction)onAddButtonPressed:(UIBarButtonItem *)sender
{
    if(![self.nameTextField.text isEqualToString:@""])
    {
        MagicalCreature *creature = [[MagicalCreature alloc]initWithName:self.nameTextField.text];
        [self.creatures addObject:creature];
        [self.tableView reloadData];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if (![segue.identifier isEqualToString:@"BattleSegue"])
    {
    CreatureViewController *creatureVC = segue.destinationViewController;

    NSIndexPath *myIndexPath = [self.tableView
                                indexPathForSelectedRow];
    self.currentCreature = [self.creatures objectAtIndex:myIndexPath.row];

    creatureVC.magicalCreature = self.currentCreature;
    }
    else
    {
        MagicalCreature *playerOne = [[MagicalCreature alloc]init];
        MagicalCreature *playerTwo = [[MagicalCreature alloc]init];

        BattleViewController *battleVC = segue.destinationViewController;


        int random = arc4random()%self.creatures.count;
        int random2 = random;

        playerOne = [self.creatures objectAtIndex:random];

        while (random == random2)
        {
            random2 = arc4random()%self.creatures.count;
        }

        playerTwo = [self.creatures objectAtIndex:random2];

        battleVC.winningCreature = playerOne;
        battleVC.losingCreature = playerTwo;







    }


    
}

-(UIImage*)resizeImage:(UIImage *)image imageSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    return newImage;

}

- (void)generateAccessories
{
    Accessories *myAccessory =  [[Accessories alloc] initWithName:@"Excalibur" aPower:80];
    [self.accessoriesArray addObject:myAccessory];
    myAccessory =  [[Accessories alloc] initWithName:@"Buriza-Do Kyanon" aPower:70];
    [self.accessoriesArray addObject:myAccessory];
    myAccessory =  [[Accessories alloc] initWithName:@"Sange and Yasha" aPower:40];
    [self.accessoriesArray addObject:myAccessory];
    myAccessory =  [[Accessories alloc] initWithName:@"Divine Rapier" aPower:100];
    [self.accessoriesArray addObject:myAccessory];
    myAccessory =  [[Accessories alloc] initWithName:@"Heaven's Halberd" aPower:60];
    [self.accessoriesArray addObject:myAccessory];
    myAccessory =  [[Accessories alloc] initWithName:@"Mjollnir" aPower:65];
    [self.accessoriesArray addObject:myAccessory];

    
}


@end
