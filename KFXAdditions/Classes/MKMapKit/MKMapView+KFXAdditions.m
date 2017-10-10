//
//  MKMapView+KFXAdditions.m
//  KFXAdditions
//
//  Created by Eyeye on 09/10/2017.
//

#import "MKMapView+KFXAdditions.h"

@implementation MKMapView (KFXAdditions)

-(void)kfx_centreOnCoordinate:(CLLocationCoordinate2D)coordinate withSpan:(CGFloat)span animated:(BOOL)animated{
    
    MKCoordinateSpan cSpan = MKCoordinateSpanMake(span, span);
    MKCoordinateRegion cRegion = MKCoordinateRegionMake(coordinate, cSpan);
    [self setRegion:cRegion animated:animated];
}

@end
