//
//  ViewController.m
//  EVAMetroMap
//
//  Created by Admin on 03.05.17.
//  Copyright © 2017 Ehlakov Victor. All rights reserved.
//

#import "EVANavigationMetroMapViewController.h"
#import "EVAMKAnnotation.h"

#import "EVARedMetroAnnotation.h"
#import "EVAGreenMetroAnnotation.h"
#import "EVABlueMetroAnnotation.h"
#import "EVAFirstMetroAnnotation.h"
#import "EVASecondMetroAnnotation.h"

#import "EVAStation.h"
#import "EVAStationSelectionViewController.h"


@interface EVANavigationMetroMapViewController () <MKMapViewDelegate>

@property (strong, nonatomic) MKDirections *directions;

@property (strong, nonatomic) EVAGreenMetroAnnotation *transitionFrom;
@property (strong, nonatomic) EVARedMetroAnnotation *transitionTo;

@property (strong, nonatomic) NSMutableArray *arrayGreen;
@property (strong, nonatomic) NSMutableArray *arrayRed;
@property (strong, nonatomic) NSMutableArray *arrayBlue;

@property (strong, nonatomic) NSMutableArray *arrayOfStationAnnotation;

@property (strong, nonatomic) EVAStation *station;
@property (strong, nonatomic) EVAStationSelectionViewController *selectStations;


@end

@implementation EVANavigationMetroMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectStations = [self.storyboard instantiateViewControllerWithIdentifier:@"EVAStationSelectionViewController"];
    self.station = [[EVAStation alloc] initWithArrays];

    self.arrayGreen = self.station.arrayOfGreenStation;
    self.arrayRed = self.station.arrayOfRedStation;
    self.arrayBlue = self.station.arrayOfBlueStation;

    self.arrayOfStation = [NSArray array];
    
    [self setup];

}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    self.arrayOfStation = self.selectStations.arrayStationForRoad;
    if ([self.arrayOfStation count] > 0) {
        [self showRoad:self.arrayOfStation];
        [self addFirstAndSecondAnnotation:self.arrayOfStation];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) dealloc{
    
    if ([self.directions isCalculating]) {
        [self.directions cancel];
    }
    
    
}

#pragma mark - Actions
- (IBAction)actionBuildRoad:(id)sender {
  
    [self.navigationController pushViewController:self.selectStations animated:YES];
    
}


-(void) addRouteForAnotationCoordinate:(CLLocationCoordinate2D)endCoordinate startCoordinate:(CLLocationCoordinate2D)startCoordinate {
    [self.ibMapView removeOverlays:[self.ibMapView overlays]];
    MKDirectionsRequest* request = [[MKDirectionsRequest alloc] init];
    
    MKPlacemark* startPlacemark = [[MKPlacemark alloc] initWithCoordinate:startCoordinate addressDictionary:nil];
    MKMapItem* startDestination = [[MKMapItem alloc] initWithPlacemark:startPlacemark];
    request.source = startDestination;
    
    MKPlacemark* endPlacemark = [[MKPlacemark alloc] initWithCoordinate:endCoordinate addressDictionary:nil];
    MKMapItem* endDestination = [[MKMapItem alloc] initWithPlacemark:endPlacemark];
        request.destination = endDestination;
    
    request.transportType = MKDirectionsTransportTypeWalking;
    request.requestsAlternateRoutes = NO;
    
    self.directions = [[MKDirections alloc] initWithRequest:request];
    
    [self.directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        } else if ([response.routes count] == 0) {
            NSLog(@"count of routes = 0");
        } else {
            NSMutableArray *array = [NSMutableArray array];
            for (MKRoute *route in response.routes){
                [array addObject:route.polyline];
            }
            [self.ibMapView addOverlays:array level:MKOverlayLevelAboveRoads];
        }
    }];
    
}

-(void) showRoad:(NSArray*) array{
    
    if ([array count] == 1) {
        EVAMKAnnotation *first = [array objectAtIndex:0];
        EVAMKAnnotation *second = [array objectAtIndex:1];
        [self addRouteForAnotationCoordinate:first.coordinate startCoordinate: second.coordinate];
    }else{
        for (int i = 0; i < [array count]-1; i++) {
            
            EVAMKAnnotation *first = [array objectAtIndex:i];
            EVAMKAnnotation *second = [array objectAtIndex:i+1];
            [self addRouteForAnotationCoordinate:first.coordinate startCoordinate: second.coordinate];
            
        }
    }

}
-(void) searchPins{
    
    MKMapRect zoomRect = MKMapRectNull;
    for (id <MKAnnotation> annotation in self.ibMapView.annotations) {
        CLLocationCoordinate2D location = annotation.coordinate;
        MKMapPoint center = MKMapPointForCoordinate(location);
        static double delta = 100000;
        MKMapRect rect = MKMapRectMake(center.x-delta, center.y-delta, delta*2, delta*2);
        zoomRect = MKMapRectUnion(zoomRect, rect);
    }
    zoomRect = [self.ibMapView mapRectThatFits:zoomRect];
    [self.ibMapView setVisibleMapRect:zoomRect edgePadding:UIEdgeInsetsMake(50, 50, 50, 50) animated:YES];

}

#pragma mark - Private Methods
-(void) setup{
    [self addAnnotation:self.arrayGreen];
    [self addAnnotation:self.arrayBlue];
    [self addAnnotation:self.arrayRed];
    
    [self searchPins];
}
-(void) addFirstAndSecondAnnotation:(NSArray*) array{
    
    NSArray *arrayTemp = [NSArray array];
    
    EVAStation *stationFirst = [array objectAtIndex:0];
    EVAFirstMetroAnnotation *annotationFirst = [[EVAFirstMetroAnnotation alloc] init];
    annotationFirst.title = stationFirst.name;
    annotationFirst.coordinate = stationFirst.coordinate;
    
    EVAStation *stationSecond = [array objectAtIndex:[array count]-1];
    EVASecondMetroAnnotation *annotationSecond = [[EVASecondMetroAnnotation alloc] init];
    annotationSecond.title = stationSecond.name;
    annotationSecond.coordinate = stationSecond.coordinate;
    
    for (EVAMKAnnotation *annotation in self.ibMapView.annotations) {
        if ([annotation.title isEqualToString:annotationFirst.title] ||  [annotation.title isEqualToString:annotationSecond.title]) {
            arrayTemp = [arrayTemp arrayByAddingObject:annotation];
            [self.ibMapView removeAnnotation:annotation];
        }
    }
    [self.ibMapView addAnnotations:@[annotationFirst, annotationSecond]];
    
}
-(void) addAnnotation:(NSArray*) array{
    
    self.arrayOfStationAnnotation = [NSMutableArray array];

    for (EVAStation *station in array){
        
        if ([station.imageString isEqualToString:@"Red.png"]) {
            
            EVARedMetroAnnotation *annotation = [[EVARedMetroAnnotation alloc] init];
            annotation.title = station.name;
            annotation.coordinate = station.coordinate;
            [self.arrayOfStationAnnotation addObject:annotation];
            
        }else if ([station.imageString isEqualToString:@"Green.png"]) {
            
            EVAGreenMetroAnnotation *annotation = [[EVAGreenMetroAnnotation alloc] init];
            annotation.title = station.name;
            annotation.coordinate = station.coordinate;
            [self.arrayOfStationAnnotation addObject:annotation];

            
        }else if ([station.imageString isEqualToString:@"Blue.png"]) {
            
            EVABlueMetroAnnotation *annotation = [[EVABlueMetroAnnotation alloc] init];
            annotation.title = station.name;
            annotation.coordinate = station.coordinate;
            [self.arrayOfStationAnnotation addObject:annotation];

            
        }
    }

    [self.ibMapView addAnnotations:self.arrayOfStationAnnotation];
}
#pragma mark - MKMapViewDelegate

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    if ([annotation isKindOfClass:[EVARedMetroAnnotation class]]) {
        
        static NSString* identifier = @"EVARedMetroAnnotation";
        
        MKAnnotationView* redAnnotation = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (!redAnnotation) {
            redAnnotation = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];

            redAnnotation.canShowCallout = YES;
            redAnnotation.draggable = NO;
            redAnnotation.image = [UIImage imageNamed:@"Red.jpg"];

        } else {
            redAnnotation.annotation = annotation;
        }
        
        return redAnnotation;
        
    }
    else if ([annotation isKindOfClass:[EVAGreenMetroAnnotation class]]){
        
        static NSString* identifier = @"EVAGreenMetroAnnotation";
        
        MKAnnotationView* greenAnnotation = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (!greenAnnotation) {
            greenAnnotation = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            
            greenAnnotation.canShowCallout = YES;
            greenAnnotation.draggable = NO;
            greenAnnotation.image = [UIImage imageNamed:@"Green.jpg"];

        } else {
            greenAnnotation.annotation = annotation;
        }
        
        return greenAnnotation;
    }
    else if ([annotation isKindOfClass:[EVABlueMetroAnnotation class]]){
        
        static NSString* identifier = @"EVABlueMetroAnnotation";
        
        MKAnnotationView* blueAnnotation = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (!blueAnnotation) {
            blueAnnotation = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            
            blueAnnotation.canShowCallout = YES;
            blueAnnotation.draggable = NO;
            blueAnnotation.image = [UIImage imageNamed:@"Blue.jpg"];
            
        } else {
            blueAnnotation.annotation = annotation;
        }
        
        return blueAnnotation;
    }
    else if ([annotation isKindOfClass:[EVAFirstMetroAnnotation class]]){
        
        static NSString* identifier = @"EVAFirstMetroAnnotation";
        
        MKAnnotationView* firstAnnotation = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (!firstAnnotation) {
            firstAnnotation = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            
            firstAnnotation.canShowCallout = YES;
            firstAnnotation.draggable = NO;
            firstAnnotation.image = [UIImage imageNamed:@"First.jpg"];
            
        } else {
            firstAnnotation.annotation = annotation;
        }
        
        return firstAnnotation;
    }
    else if ([annotation isKindOfClass:[EVASecondMetroAnnotation class]]){
        
        static NSString* identifier = @"EVASecondMetroAnnotation";
        
        MKAnnotationView* secondAnnotation = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (!secondAnnotation) {
            secondAnnotation = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            
            secondAnnotation.canShowCallout = YES;
            secondAnnotation.draggable = NO;
            secondAnnotation.image = [UIImage imageNamed:@"Second.jpg"];
            
        } else {
            secondAnnotation.annotation = annotation;
        }
        
        return secondAnnotation;
    }

    return nil;

}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay {
    
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        
        MKPolylineRenderer* lineRenderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
        lineRenderer.lineWidth = 4.f;
        lineRenderer.strokeColor = [UIColor darkGrayColor];
        return lineRenderer;
        
    }
    
    return nil;
    
}


@end
