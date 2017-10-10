//
//  MKMapView+KFXAdditions.h
//  KFXAdditions
//
//  Created by Eyeye on 09/10/2017.
//

@import MapKit;

@interface MKMapView (KFXAdditions)

-(void)kfx_centreOnCoordinate:(CLLocationCoordinate2D)coordinate
                     withSpan:(CGFloat)span
                     animated:(BOOL)animated;

@end
