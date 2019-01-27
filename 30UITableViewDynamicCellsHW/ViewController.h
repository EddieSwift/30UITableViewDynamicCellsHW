//
//  ViewController.h
//  30UITableViewDynamicCellsHW
//
//  Created by Eduard Galchenko on 1/27/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

