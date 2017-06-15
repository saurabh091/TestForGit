//
//  ViewController.m
//  TextFieldTutorial
//
//  Created by STIGA-IMAC1 on 14/06/17.
//  Copyright © 2017 Tutorial Project. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define ACCEPTABLE_CHARACTERS @"0123456789 "
#define ACCEPTABLE_DASH @"-"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tmTextField.delegate = self;
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string  {

    if (textField.text.length <= 12 || [string isEqualToString:@""]) {
    
    if (range.location == 8) {
        if ([string isEqualToString:@""] || [string isEqualToString:@"-"]) {
            
            return NO;
        }
        if ([textField.text containsString:@"-"]) {
            return NO;
        }
        NSString *tempString = [textField.text stringByAppendingString:@"-"];
        self.tmTextField.text = tempString;
        return YES;
    }else{
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARACTERS] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
        
    }
    
    
    return NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
