//
//  InitialTableViewController.m
//  the complete musician mvp 1
//
//  Created by Claudio Rojas on 7/18/16.
//  Copyright © 2016 Claudio. All rights reserved.
//

#import "InitialTableViewController.h"
#import "SecondaryTableViewController.h"

@interface InitialTableViewController ()

@end

@implementation InitialTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0)
        [cell.textLabel setText:@"Examples"];
    else
        [cell.textLabel setText:@"Exercises"];
    
    return cell;
}

#pragma mark - navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"initialToSecondary" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"initialToSecondary"]) {
        SecondaryTableViewController *vc = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        if (indexPath.row == 0)
            vc.rootPathForController = @"Text Examples";
        else
            vc.rootPathForController = @"Text Exercises";
        //vc.rootPathForController = [self.tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    }
}

@end
