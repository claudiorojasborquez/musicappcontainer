//
//  SecondaryTableViewController.m
//  the complete musician mvp 1
//
//  Created by Claudio Rojas on 7/18/16.
//  Copyright © 2016 Claudio. All rights reserved.
//

#import "SecondaryTableViewController.h"
#import "TertiaryTableViewController.h"
#import "HelperProjectFile.h"

@interface SecondaryTableViewController ()
@property NSMutableArray *dirInfo;

@end

@implementation SecondaryTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.dirInfo = getFilesAndDirectories(self.rootPathForController, YES, NO);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dirInfo count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *thisCellPointsTo = [self.dirInfo objectAtIndex:indexPath.row];
    [cell.textLabel setText: [[thisCellPointsTo componentsSeparatedByString:@"_"] objectAtIndex:1]];
    return cell;
}

#pragma mark - navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"secondaryToTertiary" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"secondaryToTertiary"]) {
        TertiaryTableViewController *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        vc.rootPathForController = [NSString stringWithFormat: @"%@/%@", self.rootPathForController, [self.dirInfo objectAtIndex:indexPath.row]];
        
        
        //vc.rootPathForController = [self.tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    }
}

@end
