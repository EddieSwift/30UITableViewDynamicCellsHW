//
//  ViewController.m
//  30UITableViewDynamicCellsHW
//
//  Created by Eduard Galchenko on 1/27/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) CGFloat red;
@property (assign, nonatomic) CGFloat green;
@property (assign, nonatomic) CGFloat blue;

@property (strong, nonatomic) NSString *rgbColorData;
@property (strong, nonatomic) EGBColorRow *colorRow;
@property (strong, nonatomic) NSMutableArray *arrayOfColoredRows;

@end

static const NSInteger amountOfRows = 1000;

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.arrayOfColoredRows = [NSMutableArray array];
    
    for (int i = 0; i < amountOfRows; i++) {
        
        self.colorRow = [[EGBColorRow alloc] init];
        
        self.colorRow.color = [self randomColor];
        self.colorRow.name = [NSString stringWithFormat:@"RGB(%1.0f, %1.0f, %1.0f)", self.red, self.green, self.blue];
        
        
        [self.arrayOfColoredRows insertObject:self.colorRow atIndex:i];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"numberOfSectionsInTableView - %@", tableView);
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection %ld", (long)section);
    
    return amountOfRows;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    NSString *myColoredRows = @"myColoredRows";

    return myColoredRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForRowAtIndexPath {%ld, %ld}", (long)indexPath.section, (long)indexPath.row);
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSLog(@"Cell created!");
        
    } else {
        
        NSLog(@"Cell reused!");
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.arrayOfColoredRows[indexPath.row] name]];
    cell.backgroundColor = (__bridge UIColor * _Nullable)([self.arrayOfColoredRows[indexPath.row] color]);
    
    return cell;
}

#pragma mark - Private methods

- (UIColor*) randomColor {
    
    NSLog(@"New color for cell created!");
    
    CGFloat r = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255.f;
    
    self.red = (CGFloat)(r * 255.f);
    self.green = (CGFloat)(g * 255.f);
    self.blue = (CGFloat)(b * 255.f);

    NSLog(@"RGB(%f, %f, %f)", r, g, b);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}


@end
