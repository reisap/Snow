//
//  ShowMenu.m
//  snow
//
//  Created by reisa prasaptaraya on 5/2/16.
//  Copyright © 2016 reisa prasaptaraya. All rights reserved.
//

#import "ShowMenu.h"
#import "DataImport.h"
#import "ViewController.h"

@interface ShowMenu ()
@property(nonatomic, strong)RBMenu *menu;
@end

@implementation ShowMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //creating the menu items
     ViewController *firstViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self setViewControllers:@[firstViewController] animated:NO];
    
    RBMenuItem *item = [[RBMenuItem alloc]initMenuItemWithTitle:@"First" withCompletionHandler:^(BOOL finished){
        
        ViewController *firstViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self setViewControllers:@[firstViewController] animated:NO];
        
    }];
    RBMenuItem *item2 = [[RBMenuItem alloc]initMenuItemWithTitle:@"Second" withCompletionHandler:^(BOOL finished){
        
       ViewController *secondViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self setViewControllers:@[secondViewController] animated:NO];
        
        
        
    }];
    
    _menu = [[RBMenu alloc] initWithItems:@[item, item2] textColor:[UIColor colorWithRed:133/255.0 green:61/255.0 blue:174/255.0 alpha:1.0] hightLightTextColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithRed:73/255.0 green:36/255.0 blue:78/255.0 alpha:1.0] andTextAlignment:RBMenuTextAlignmentLeft forViewController:self];
    
    
}

- (void)showMenu{
    
    [_menu showMenu];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
