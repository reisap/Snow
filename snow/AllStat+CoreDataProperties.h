//
//  AllStat+CoreDataProperties.h
//  snow
//
//  Created by reisa prasaptaraya on 5/3/16.
//  Copyright © 2016 reisa prasaptaraya. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AllStat.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllStat (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *elevation;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *timezone;
@property (nullable, nonatomic, retain) NSString *triplet;
@property (nullable, nonatomic, retain) NSNumber *wind;
@property (nullable, nonatomic, retain) NSNumber *lat;
@property (nullable, nonatomic, retain) NSNumber *lng;

@end

NS_ASSUME_NONNULL_END
