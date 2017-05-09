//
//  EVAStationSelectionViewController.m
//  EVAMetroMap
//
//  Created by Admin on 05.05.17.
//  Copyright © 2017 Ehlakov Victor. All rights reserved.
//

#import "EVAStationSelectionViewController.h"

#import "EVANavigationMetroMapViewController.h"
#import "EVAStation.h"

@interface EVAStationSelectionViewController () <UIPickerViewDataSource>

@property (strong, nonatomic) NSMutableArray *arrayFirstDataSource;
@property (strong, nonatomic) NSMutableArray *arraySecondDataSource;
@property (strong, nonatomic) EVAStation *station;


@end

@implementation EVAStationSelectionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.station = [[EVAStation alloc] initWithArrays];
    
    self.arrayFirstDataSource = self.station.arrayOfRedStation;
    self.arraySecondDataSource = self.station.arrayOfRedStation;
    
    self.ibFirstSegmentControl.backgroundColor = [UIColor redColor];
    self.ibSecondSegmentControl.backgroundColor = [UIColor redColor];
    self.ibFirstSegmentControl.tintColor = [UIColor grayColor];
    self.ibSecondSegmentControl.tintColor = [UIColor grayColor];

    self.ibFirstPickerView.showsSelectionIndicator = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)actionFirstSegmentControl:(id)sender {
    
    
    if (self.ibFirstSegmentControl.selectedSegmentIndex == 0) {
        self.arrayFirstDataSource = self.station.arrayOfRedStation;
        self.ibFirstSegmentControl.backgroundColor = [UIColor redColor];
    }else if (self.ibFirstSegmentControl.selectedSegmentIndex == 1) {
        self.arrayFirstDataSource = self.station.arrayOfGreenStation;
        self.ibFirstSegmentControl.backgroundColor = [UIColor greenColor];
    }else if (self.ibFirstSegmentControl.selectedSegmentIndex == 2) {
        self.arrayFirstDataSource = self.station.arrayOfBlueStation;
        self.ibFirstSegmentControl.backgroundColor = [UIColor blueColor];
    }
    
    [self.ibFirstPickerView reloadAllComponents];
}

- (IBAction)actionSecondSegmentControl:(id)sender {
    
    
    if (self.ibSecondSegmentControl.selectedSegmentIndex == 0) {
        self.arraySecondDataSource = self.station.arrayOfRedStation;
        self.ibSecondSegmentControl.backgroundColor = [UIColor redColor];
    }else if (self.ibSecondSegmentControl.selectedSegmentIndex == 1) {
        self.arraySecondDataSource = self.station.arrayOfGreenStation;
        self.ibSecondSegmentControl.backgroundColor = [UIColor greenColor];
    }else if (self.ibSecondSegmentControl.selectedSegmentIndex == 2) {
        self.arraySecondDataSource = self.station.arrayOfBlueStation;
        self.ibSecondSegmentControl.backgroundColor = [UIColor blueColor];
    }

    [self.ibSecondPickerView reloadAllComponents];

}

- (IBAction)actionCalculation:(id)sender {
    
    if (self.ibFirstSegmentControl.selectedSegmentIndex == self.ibSecondSegmentControl.selectedSegmentIndex && [self.ibFirstPickerView selectedRowInComponent:0] == [self.ibSecondPickerView selectedRowInComponent:0]) {
        
        [self showAlertTitle:@"Погодите...)" andMessage:@"Вы уже находитесь на нужной Вам станции"];
        self.arrayStationForRoad = [NSArray arrayWithObject:[self.arrayFirstDataSource objectAtIndex:[self.ibFirstPickerView selectedRowInComponent:0]]];
        
    }else{
        
        NSArray *array = [self.station generateArrayOfStation:self.ibFirstSegmentControl.selectedSegmentIndex numberOfRowsInFirst:[self.ibFirstPickerView selectedRowInComponent:0] andIndex:self.ibSecondSegmentControl.selectedSegmentIndex numberOfRowsInSecond:[self.ibSecondPickerView selectedRowInComponent:0]];
        self.arrayStationForRoad = array;
        
        NSMutableString *string = [NSMutableString string];
        
        for (int i = 0; i < [array count]; i++) {
            EVAStation *station = [array objectAtIndex:i];
            [string appendFormat:@"%d.%@ ", i, station.name];
        }
        
        [self showAlertTitle:[NSString stringWithFormat:@"Ваш путь состоит из %ld станций:", [array count]-1] andMessage:string];
        
    }
}
- (IBAction)actionCancel:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

-(void) showAlertTitle:(NSString*) title andMessage:(NSString*) message{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"ОК" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        [alertController dismissViewControllerAnimated:YES completion:nil];
        
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}
#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    if (pickerView.tag == 1) {
        return [self.arrayFirstDataSource count];
    }else if (pickerView.tag == 2){
        return [self.arraySecondDataSource count];
    }
    
    return 0;
}

#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSMutableArray *array = [NSMutableArray array];
    
    if (thePickerView.tag == 1) {
        array = self.arrayFirstDataSource;
    }else if (thePickerView.tag == 2){
        array = self.arraySecondDataSource;
    }
    
    EVAStation *station = [array objectAtIndex:row];
    return station.name;
}


@end
