//
//  ViewController.m
//  BMR
//
//  Created by Rj on 2/16/16.
//  Copyright © 2016 Rj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.sharedPerson = [Person sharedPerson];
    
    if(self.genderSegmentControl.selectedSegmentIndex == 0)
    {
        self.view.backgroundColor = [UIColor purpleColor];
    }
    else
    {
        self.view.backgroundColor = [UIColor yellowColor];
    }
    
    // display proper units
    if(self.unitChangeSegmentControl.selectedSegmentIndex == 0)
    {
        // U.S. units
        self.heightUnitsLabel.text = @"in";
        self.massUnitsLabel.text = @"lb";
    }
    else
    {
        // Metric units
        self.heightUnitsLabel.text = @"cm";
        self.massUnitsLabel.text = @"kg";
    }
    
    self.resultLabel.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing: YES];
}

- (IBAction)genderChangePressed:(id)sender
{
    if(self.genderSegmentControl.selectedSegmentIndex == 0)
    {
        self.view.backgroundColor = [UIColor purpleColor];
    }
    else
    {
        self.view.backgroundColor = [UIColor yellowColor];
    }
}

- (IBAction)unitChangePressed:(id)sender
{
    // Change unit labels
    if(self.unitChangeSegmentControl.selectedSegmentIndex == 0)
    {
        // U.S. units
        self.heightUnitsLabel.text = @"in";
        self.massUnitsLabel.text = @"lb";
    }
    else
    {
        // Metric units
        self.heightUnitsLabel.text = @"cm";
        self.massUnitsLabel.text = @"kg";
    }
}

- (IBAction)calculatePressed:(id)sender
{
    int     emptyTextFields = 0;
    
    // check if a textfield is unfilled/empty
    if([self.heightTextField.text isEqualToString: @""] || [self.heightTextField.text isEqualToString: @"0"])
    {
        ++emptyTextFields;
    }
    
    if([self.massTextField.text isEqualToString: @""] || [self.massTextField.text isEqualToString: @"0"])
    {
        ++emptyTextFields;
    }
    
    if([self.ageTextField.text isEqualToString: @""] || [self.ageTextField.text isEqualToString: @"0"])
    {
        ++emptyTextFields;
    }
    
    // if there were no empty textfields
    if(emptyTextFields == 0)
    {
        if(self.unitChangeSegmentControl.selectedSegmentIndex == 0)
        {
            // We are working in U.S. units, we need to convert values.
            
            self.sharedPerson.height = [NSNumber numberWithFloat:(self.heightTextField.text.floatValue / 0.39370)];
            
            self.sharedPerson.mass = [NSNumber numberWithFloat:(self.massTextField.text.floatValue / 2.2046)];
        }
        else
        {
            // We are working in Metric units.
            
            self.sharedPerson.height = [NSNumber numberWithFloat:self.heightTextField.text.floatValue];
            
            self.sharedPerson.mass = [NSNumber numberWithFloat:self.massTextField.text.floatValue];
        }
        
        self.sharedPerson.age = [NSNumber numberWithInt: self.ageTextField.text.intValue];
        
        if(self.genderSegmentControl.selectedSegmentIndex == 0)
        {
            // Male is selected
            self.sharedPerson.sex = @"Male";
        }
        else
        {
            // Female is selected
            self.sharedPerson.sex = @"Female";
        }
        
        NSNumber *result = [self.sharedPerson getBMR];
        
        self.resultLabel.text = [NSString stringWithFormat:@"BMR is %.02f kcal/day", result.floatValue];
    }
    else
    {
        // empty fields were found, display warning message popup
        self.resultLabel.text = @"Empty or Invalid Field(s) Detected";
    }

}


@end
