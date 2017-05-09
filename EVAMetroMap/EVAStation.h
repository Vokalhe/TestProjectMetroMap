//
//  EVAStation.h
//  EVAMetroMap
//
//  Created by Admin on 05.05.17.
//  Copyright © 2017 Ehlakov Victor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>
#import <UIKit/UIKit.h>

@interface EVAStation : NSObject

@property(assign, nonatomic) CLLocationCoordinate2D coordinate;
@property(copy, nonatomic) NSString *name;
@property(copy, nonatomic) NSString *imageString;
@property (strong, nonatomic) NSArray *arrayOfStationFinal;

@property (strong, nonatomic) NSMutableArray *arrayOfRedStation;
@property (strong, nonatomic) NSMutableArray *arrayOfGreenStation;
@property (strong, nonatomic) NSMutableArray *arrayOfBlueStation;

-(NSArray*) generateArrayOfStation:(NSInteger) selectSegmentIndexFirst numberOfRowsInFirst:(NSInteger) numberFirst andIndex:(NSInteger)selectSegmentIndexSecond numberOfRowsInSecond:(NSInteger) numberSecond;

- (id)initWithArrays;

@end
