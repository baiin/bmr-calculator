//
//  ViewController.h
//  BMR
//
//  Created by Rj on 2/16/16.
//  Copyright © 2016 Rj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController

// singleton 
@property Person  *sharedPerson;

// textfields
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;

@property (weak, nonatomic) IBOutlet UITextField *massTextField;

@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegmentControl;

@property (weak, nonatomic) IBOutlet UISegmentedControl *unitChangeSegmentControl;

// labels
@property (weak, nonatomic) IBOutlet UILabel *heightUnitsLabel;

@property (weak, nonatomic) IBOutlet UILabel *massUnitsLabel;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

// functions
- (IBAction)unitChangePressed:(id)sender;

- (IBAction)calculatePressed:(id)sender;

@end

