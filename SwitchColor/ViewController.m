//
//  ViewController.m
//  SwitchColor
//
//  Created by sen5labs on 14-12-3.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UILabel *RLabel;
@property (weak, nonatomic) IBOutlet UILabel *GLabel;
@property (weak, nonatomic) IBOutlet UILabel *BLabel;
@property (weak, nonatomic) IBOutlet UILabel *RResult;
@property (weak, nonatomic) IBOutlet UILabel *GResult;
@property (weak, nonatomic) IBOutlet UILabel *BResult;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)beginSwitch:(id)sender {
    
    NSString *str = self.inputText.text;
    for (int i = 0; i < str.length; i++) {
        if (i % 2 == 0 && str.length == 6) {
            NSRange range = NSMakeRange(i, 2);
            NSString *value = [str substringWithRange:range];
            NSString *result = [self singleSwitch:value];
            switch (i) {
                case 0:
                    self.RLabel.text  = value;
                    self.RResult.text = result;
                    break;
                case 2:
                    self.GLabel.text = value;
                    self.GResult.text = result;
                    break;
                case 4:
                    self.BLabel.text = value;
                    self.BResult.text = result;
                    break;
                default:
                    break;
            }
        }
    }
}


/**
 *  十六进制如 FFFFFF，共六位，拆开分别获取 R 、 G 、 B
 */
- (NSString *)singleSwitch:(NSString *)colorValue
{
    int total = 0;
    
    for (int i = 0; i<colorValue.length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString * num1 = [colorValue substringWithRange:range];
        if ([num1 isEqualToString:@"A"] || [num1 isEqualToString:@"a"]) {
            num1 = @"10";
        }else if ([num1 isEqualToString:@"B"] || [num1 isEqualToString:@"b"]) {
            num1 = @"11";
        }else if ([num1 isEqualToString:@"C"] || [num1 isEqualToString:@"c"]) {
            num1 = @"12";
        }else if ([num1 isEqualToString:@"D"] || [num1 isEqualToString:@"d"]) {
            num1 = @"13";
        }else if ([num1 isEqualToString:@"E"] || [num1 isEqualToString:@"e"]) {
            num1 = @"14";
        }else if ([num1 isEqualToString:@"F"] || [num1 isEqualToString:@"f"]) {
            num1 = @"15";
        }
        
        if (i%2==0) {
            total = [num1 intValue] * 16;
        }else{
            total = total + [num1 intValue];
        }
    }
    NSString *valueText = [NSString stringWithFormat:@"%d",total];
    return valueText;
}

@end
