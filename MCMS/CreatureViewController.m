//
//  CreatureViewController.m
//  MCMS
//
//  Created by Diego Cichello on 1/13/15.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UINavigationItem *editButton;
@property (weak, nonatomic) IBOutlet UITextField *creatureNameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *creatureDetailTextField;
@property (weak, nonatomic) IBOutlet UILabel *creatureDetailLabel;
@property (weak, nonatomic) IBOutlet UITableView *accessoriesTableView;
@property int numberOfEquips;
@property BOOL isEditButtonPressed;
@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.numberOfEquips = 0;
    self.creatureNameLabel.text = self.magicalCreature.creatureName;
    self.creatureNameTextField.hidden = true;
    self.creatureDetailLabel.text = self.magicalCreature.detail;
    self.creatureDetailTextField.hidden =true;
    self.imageView.image = [UIImage imageNamed:self.magicalCreature.creatureName];

    [self sizeToFitAll];
    [self.accessoriesTableView reloadData];

    NSLog(@"%li",self.magicalCreature.accessory.count);


}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)editButton
{

    //Change if its Done, or Editing

    if (!self.isEditButtonPressed)
    {
        editButton.title = @"Done";


        self.creatureNameTextField.text = self.creatureNameLabel.text;
        self.creatureDetailTextField.text = self.creatureDetailLabel.text;

        [self sizeToFitAll];




    }
    else
    {
        editButton.title = @"Edit";
        self.creatureNameLabel.text = self.creatureNameTextField.text;
        self.creatureDetailTextField.text = self.creatureDetailLabel.text;

        self.magicalCreature.creatureName = self.creatureNameLabel.text;
        self.magicalCreature.detail = self.creatureDetailLabel.text;

        [self sizeToFitAll];



    }
    self.isEditButtonPressed = !self.isEditButtonPressed;
    self.creatureNameLabel.hidden = !self.creatureNameLabel.hidden;
    self.creatureNameTextField.hidden = !self.creatureNameLabel.hidden;
    self.creatureDetailTextField.hidden = !self.creatureDetailTextField.hidden;
    self.creatureDetailLabel.hidden = !self.creatureDetailLabel.hidden;


    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.magicalCreature.accessory.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AccCell"];

    Accessories *accesory =  [self.magicalCreature.accessory objectAtIndex:indexPath.row];

    cell.textLabel.text = accesory.name;


    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:true];

    if (indexPath.section == 0)
    {


        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        if (selectedCell.accessoryType == UITableViewCellAccessoryNone)
        {
            if (self.numberOfEquips < 2)
            {
                selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
                self.numberOfEquips++;
                Accessories *acc = [self.magicalCreature.accessory objectAtIndex:indexPath.row];
                acc.isEquiped = true;
            }
            else
            {
                UIAlertView *alertview = [[UIAlertView alloc]init];
                alertview.title =@"Error";
                alertview.message=@"You can only have 2 accessories equipped";
                [alertview addButtonWithTitle:@"OK"];
                [alertview show];
            }

        }
        else if (selectedCell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            selectedCell.accessoryType = UITableViewCellAccessoryNone;
            self.numberOfEquips--;
            Accessories *acc = [self.magicalCreature.accessory objectAtIndex:indexPath.row];
            acc.isEquiped = false;
        }
    }
}

- (void)sizeToFitAll
{
    [self.creatureDetailLabel sizeToFit];
    [self.creatureDetailTextField sizeToFit];

    [self.creatureNameLabel sizeToFit];
    [self.creatureNameTextField sizeToFit];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
