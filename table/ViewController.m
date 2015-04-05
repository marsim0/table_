//
//  ViewController.m
//  table
//
//  Created by Мариам Б. on 05.04.15.
//  Copyright (c) 2015 Мариам Б. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray * rusWords;
@property (nonatomic, strong) NSArray * engWords;
@property (nonatomic, strong) NSMutableArray * mutable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * stringRusWords = @"тетрадь,собака,ложка,дом";
    NSString * stringEngWords = @"notebook,dog,spoon,house";
    
    self.rusWords = [stringRusWords componentsSeparatedByString:@","];
    self.engWords = [stringEngWords componentsSeparatedByString:@","];
    self.mutable = [NSMutableArray array];
    
    for (int i = 0; i < self.rusWords.count; i++) {
        NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                               [self.rusWords objectAtIndex: i ], @"r",
                               [self.engWords objectAtIndex: i ], @"e", nil];
        [self.mutable addObject:dict];
    }

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        
    return self.mutable.count ;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * simpleTableIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[self.mutable objectAtIndex:indexPath.row]valueForKey:@"r"];
    cell.detailTextLabel.text = [[self.mutable objectAtIndex:indexPath.row]valueForKey:@"e"];
    
    return cell;
}


@end
