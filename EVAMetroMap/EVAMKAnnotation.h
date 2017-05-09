//
//  EVAMKAnnotation.h
//  EVAMetroMap
//
//  Created by Admin on 03.05.17.
//  Copyright © 2017 Ehlakov Victor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface EVAMKAnnotation : NSObject <MKAnnotation>

@property(assign, nonatomic) CLLocationCoordinate2D coordinate;
@property(copy, nonatomic) NSString *title;
@property(copy, nonatomic) NSString *subtitle;

@end
