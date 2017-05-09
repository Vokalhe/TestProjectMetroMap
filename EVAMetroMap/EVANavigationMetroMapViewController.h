//
//  ViewController.h
//  EVAMetroMap
//
//  Created by Admin on 03.05.17.
//  Copyright © 2017 Ehlakov Victor. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>

@interface EVANavigationMetroMapViewController : UIViewController

@property (strong, nonatomic) IBOutlet MKMapView *ibMapView;

@property (strong, nonatomic) NSArray *arrayOfStation;

- (IBAction)actionBuildRoad:(id)sender;
-(void) addAnnotation:(NSArray*) array;


@end

