//
//  cell_peta.h
//  snow
//
//  Created by reisa prasaptaraya on 5/2/16.
//  Copyright © 2016 reisa prasaptaraya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocation/CoreLocation.h"
#import "MapKit/MapKit.h"

@interface cell_peta : UITableViewCell <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
