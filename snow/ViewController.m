//
//  ViewController.m
//  snow
//
//  Created by reisa prasaptaraya on 5/2/16.
//  Copyright © 2016 reisa prasaptaraya. All rights reserved.
//

#import "ViewController.h"
#import "cell_peta.h"
#import "cell_stations.h"
#import "DataImport.h"

@interface ViewController (){
    NSNumber *UserCount;
    NSArray *sortedNotifikasi;
}
@property (weak, nonatomic) IBOutlet UITableView *tbl_utama;
@property(nonatomic, strong)RBMenu *menu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 25, 32, 32 )];
    imgView.image = [UIImage imageNamed:@"locat.png"];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    
    self.navigationItem.titleView = imgView;
    
    self.navigationController.navigationBar.topItem.title = @"";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:133/255.0 green:61/255.0 blue:174/255.0 alpha:1.0];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    UIImage* image3 = [UIImage imageNamed:@"circle-menu.png"];
    CGRect frameimg = CGRectMake(0, 0, 32, 32);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    [someButton setBackgroundImage:image3 forState:UIControlStateNormal];
    [someButton addTarget:self action:@selector(openMenu) forControlEvents:UIControlEventTouchUpInside];
    [someButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *mailbutton =[[UIBarButtonItem alloc] initWithCustomView:someButton];
   // self.navigationItem.leftBarButtonItem=mailbutton;
    //[self.navigationItem.leftBarButtonItem setAction:@selector(showMenu)];
    // Do any additional setup after loading the view, typically from a nib.
     UserCount = [AllStat MR_numberOfEntities];
    NSLog(@"ini data UserCount = %@",UserCount);
    NSInteger value = [UserCount integerValue];
    if(value == 0){
    [self getDataPeta];
    }
    else{
    sortedNotifikasi= [AllStat MR_findAllSortedBy:@"elevation" ascending:YES];
    NSLog(@"ini data ketinggiannya = %@",sortedNotifikasi);
    }
    
    self.tbl_utama.estimatedRowHeight = 75.0 ;
    self.tbl_utama.rowHeight = UITableViewAutomaticDimension;
}

-(void)openMenu {
    NSLog(@"aaaa");
    [_menu showMenu];
}


-(void)getDataPeta{
    [SVProgressHUD show];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // time-consuming task
        NSString* iniURL = [NSString stringWithFormat:@"%@stations",urlUtama];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:iniURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            // do whatever you'd like here; for example, if you want to convert
            // it to a string and log it, you might do something like:
            
            NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            //NSLog(@"ini data statsiun = %@", string);
//            NSMutableArray* dataJSon = [[NSMutableArray alloc]init];
//            [dataJSon addObject:string];
            NSError* error = nil;
            
            NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
            if (error)
                NSLog(@"JSONObjectWithData error: %@", error);
            
            
            NSLog(@"ini data statsiun = %@", array);
            
           int count = [array count];
//            
////            UserData *isi = [UserData MR_createEntity];
////            isi.judul = _txt_judul.text;
////            isi.input1 = _txt_input1.text;
////            isi.input2 = _txt_input2.text;
////            isi.timestamp = [NSNumber numberWithInteger:[timestamp integerValue]];
            int i =0;
            if(count != 0){
                while (i < count){
                    AllStat *dataku = [AllStat MR_createEntity];
                    NSMutableDictionary* dataName = [array objectAtIndex:i];
                    NSString* elevation = [dataName  objectForKey:@"elevation"];
                    NSString* name = [dataName  objectForKey:@"name"];
                    NSString* timezone = [dataName  objectForKey:@"timezone"];
                    NSString* triplet = [dataName  objectForKey:@"triplet"];
                    NSString* wind = [dataName  objectForKey:@"wind"];
                    NSDictionary* location = [dataName  objectForKey:@"location"];
                     NSString* lat = [location  objectForKey:@"lat"];
                     NSString* lng = [location  objectForKey:@"lng"];
                    
                    //NSLog(@"ini lat =%@",lang);
                    
                    dataku.elevation = [NSNumber numberWithInt:[elevation intValue]];
                    dataku.name = name;
                    dataku.timezone = [NSNumber numberWithInt:[timezone intValue]];;
                    dataku.triplet = triplet;
                    dataku.wind = [NSNumber numberWithBool:[wind boolValue]];
                    dataku.lat = [NSNumber numberWithFloat:[lat floatValue]];
                    dataku.lng = [NSNumber numberWithFloat:[lng floatValue]];
                    
                    //Save to persistant storage
                    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
                    
                    i++;
                    
                }
//
           }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    });

}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return UITableViewAutomaticDimension;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if (section == 0) {
        
        return 286;
    }
    else{
        return 0;
    }
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView;
     static NSString *cellIdentifier = @"cell_peta";
     AllStat *object = sortedNotifikasi[section];
    if (section == 0){
        cell_peta *cell = (cell_peta *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"cell_peta" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
        }
        
        //    [cell.layer setShadowOffset:CGSizeMake(5, 5)];
        //    [cell.layer setShadowColor:[[UIColor blackColor] CGColor]];
        //    [cell.layer setShadowOpacity:0.5];
        
        // Just want to test, so I hardcode the data
        //    cell.txt_judul.text = [NSString stringWithFormat:@"%@",object.judul];
        //    cell.txt_pelanggan.text = [NSString stringWithFormat:@"%@ - %@",object.input1, object.input2];
//        MKMapView *mapView = (MKMapView*)[cell viewWithTag:2];
//        cell.map.delegate = cell;
//        //Takes a center point and a span in miles (converted from meters using above method)
//        CLLocationCoordinate2D startCoord = CLLocationCoordinate2DMake(37.766997, -122.422032);
//        MKCoordinateRegion adjustedRegion = [mapView regionThatFits:MKCoordinateRegionMakeWithDistance(startCoord,10, 10)];
//        [cell.map setRegion:adjustedRegion animated:YES];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else {
        [headerView setBackgroundColor:[UIColor clearColor]];
        return headerView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    UIView *headerView;
    if (section == ([tableView numberOfSections] - 1)) {
        // pageLoad +=10;
        NSLog(@"ini footer masuk reload data");
        //  [self SinkronDataNotifikasi: pageLoad];
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 70)];
        
        [headerView setBackgroundColor:[UIColor whiteColor]];
        
        return 0;
    }
    else{
        return 0;
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    return 286.0f;
//}
#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
//    NSLog(@"ini data user = %@",UserCount);
  int value = [UserCount integerValue];
   
    return value;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
     static NSString *cellIdentifier2 = @"cell_stations";
    AllStat *object = sortedNotifikasi[indexPath.section];
    
    
    
        cell_stations *cell = (cell_stations *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"cell_stations" owner:self options:nil];
            // Grab a pointer to the first object (presumably the custom cell, as that's all the XIB should contain).
            cell = [topLevelObjects objectAtIndex:0];
        }
        
         cell.txt_nama.text = [NSString stringWithFormat:@"%@",object.name];
        return  cell;
    
}



#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UserData *object = sortedNotifikasi[indexPath.section];
//    NSString* input1 = [NSString stringWithFormat:@"%@",object.input1] ;
//    NSString* input2 = [NSString stringWithFormat:@"%@",object.input2];
//    NSLog(@"selected %ld row", (long)indexPath.row);
//    
//    NSString * storyboardName = @"Main";
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
//    DetailTagihan * vc = [storyboard instantiateViewControllerWithIdentifier:@"DetailTagihan"];
//    [vc getDataUserTagihan:input1 :input2 ];
//    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
