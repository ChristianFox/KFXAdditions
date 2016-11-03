

//-----------------------------------------------------------
#pragma mark - Float & Double equality
//-----------------------------------------------------------
#define clLoc_fequal(a,b) (fabsf((a) - (b)) < FLT_EPSILON)
#define clLoc_fequalzero(a) (fabsf(a) < FLT_EPSILON)
#define clLoc_dequal(a,b) (fabs((a) - (b)) < DBL_EPSILON)
#define clLoc_dequalzero(a) (fabs(a) < DBL_EPSILON)


#import "CLLocation+KFXAdditions.h"
#import "NSDate+KFXAdditions.h"

@implementation CLLocation (KFXAdditions)


//--------------------------------------------------------
#pragma mark - Queries
//--------------------------------------------------------
#pragma mark Accuracy
-(BOOL)kfx_isDesiredHorizontalAccuracy:(CLLocationAccuracy)desiredAccuracy{
    
    return self.horizontalAccuracy <= desiredAccuracy;
}

-(BOOL)kfx_isDesiredVerticalAccuracy:(CLLocationAccuracy)desiredAccuracy{
    
    return self.verticalAccuracy <= desiredAccuracy;
}

#pragma mark Freshness
-(BOOL)kfx_isFresh:(NSTimeInterval)desiredAge{
    
    NSTimeInterval locationAge = -[self.timestamp timeIntervalSinceNow];
    return locationAge <= desiredAge;
}

-(BOOL)kfx_isStale:(NSTimeInterval)desiredAge{
    
    NSTimeInterval locationAge = -[self.timestamp timeIntervalSinceNow];
    return locationAge > desiredAge;
}

-(BOOL)kfx_isMoreRecentThan:(NSDate *)date{
    
    return [self.timestamp kfx_isEarlierThanDate:date];
}

#pragma mark Coordinate Validity
-(BOOL)kfx_isCoordinateValid{
    return CLLocationCoordinate2DIsValid(self.coordinate);
}

-(BOOL)kfx_isCoordinateZeroZero{
    
    if (clLoc_dequalzero(self.coordinate.latitude)) {
        
        if (clLoc_dequalzero(self.coordinate.longitude)) {
            return YES;
        }
    }
    return NO;
}

#pragma mark Compare Locations
-(BOOL)kfx_isSameTimestampAs:(CLLocation*)otherLocation{
    
    return [self.timestamp compare:otherLocation.timestamp] == NSOrderedSame;
}

-(BOOL)kfx_isSameCoordinatesAs:(CLLocation*)otherLocation{
    
    if (clLoc_dequal(self.coordinate.latitude, otherLocation.coordinate.latitude)) {
        
        if (clLoc_dequal(self.coordinate.longitude, otherLocation.coordinate.longitude)) {
            return YES;
        }
    }
    return NO;
}

-(BOOL)kfx_isGreaterHorizontalAccuracyThan:(CLLocation*)otherLocation{
 
    return self.horizontalAccuracy > otherLocation.horizontalAccuracy;
}

-(BOOL)kfx_isGreaterVerticalAccuracyThan:(CLLocation*)otherLocation{
    
    return self.verticalAccuracy > otherLocation.verticalAccuracy;
}



//--------------------------------------------------------
#pragma mark - Formatting
//--------------------------------------------------------
#pragma mark Combined
-(NSString*)kfx_descriptionShort{
    return [NSString stringWithFormat:@"%@ %@",
            [self kfx_formattedCoordinates],
            [self kfx_formattedHorizontalAccuracy]];
}

-(NSString*)kfx_descriptionMedium{
    return [NSString stringWithFormat:@"%@ %@ %@",
            [self kfx_formattedCoordinates],
            [self kfx_formattedHorizontalAccuracy],
            [self kfx_formattedSpeed]];

}

-(NSString*)kfx_descriptionFull{
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@",
            [self kfx_formattedCoordinates],
            [self kfx_formattedHorizontalAccuracy],
            [self kfx_formattedVerticalAccuracy],
            [self kfx_formattedSpeed],
            [self kfx_formattedCourse],
            [self kfx_formattedTimeStamp]];
}

#pragma mark Single Properties
-(NSString*)kfx_formattedCoordinates{
    return [NSString stringWithFormat:@"<%@%f, %@%f>",
            (self.coordinate.latitude < 0.0) ? @"":@"+",
            self.coordinate.latitude,
            (self.coordinate.longitude < 0.0) ? @"":@"+",
            self.coordinate.longitude];
}

-(NSString*)kfx_formattedHorizontalAccuracy{
    return [NSString stringWithFormat:@"<HozAcc: +/- %.2fm>",
            self.horizontalAccuracy];
}

-(NSString*)kfx_formattedVerticalAccuracy{
    return [NSString stringWithFormat:@"<VertAcc: +/- %.2fm>",
            self.verticalAccuracy];
}

-(NSString*)kfx_formattedSpeed{
    return [NSString stringWithFormat:@"Speed %.2fmps>",
            self.speed];
}

-(NSString*)kfx_formattedCourse{
    return [NSString stringWithFormat:@"Course %.2f>",
            self.course];

}

-(NSString*)kfx_formattedTimeStamp{
    return self.timestamp.description;
}










@end


















