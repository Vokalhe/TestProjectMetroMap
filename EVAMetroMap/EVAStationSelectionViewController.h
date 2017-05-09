//
//  EVAStationSelectionViewController.h
//  EVAMetroMap
//
//  Created by Admin on 05.05.17.
//  Copyright © 2017 Ehlakov Victor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EVAStation;

@interface EVAStationSelectionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *ibFirstSegmentControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *ibSecondSegmentControl;
@property (weak, nonatomic) IBOutlet UIPickerView *ibFirstPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *ibSecondPickerView;

@property (strong, nonatomic) NSArray *arrayStationForRoad;

- (IBAction)actionFirstSegmentControl:(id)sender;
- (IBAction)actionSecondSegmentControl:(id)sender;
- (IBAction)actionCalculation:(id)sender;
- (IBAction)actionCancel:(id)sender;



@end
