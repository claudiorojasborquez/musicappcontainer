//
//  DetailViewController.m
//  the complete musician mvp 1
//
//  Created by Claudio Rojas on 7/18/16.
//  Copyright © 2016 Claudio. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *components = [[[[self.filePath stringByDeletingPathExtension] componentsSeparatedByString:@"/"] lastObject] componentsSeparatedByString:@" "];
    //{2, components.count -1}
    [self.label setText: [[components subarrayWithRange:NSMakeRange(2, components.count - 2)] componentsJoinedByString:@" "]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchDownButton:(id)sender {
    NSString * resourcePath =[[NSBundle mainBundle]  resourcePath];
    resourcePath = [NSString stringWithFormat:@"%@/%@", resourcePath, self.filePath];;
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: resourcePath];
    self.player = [AVAudioPlayer alloc];
    [self.player initWithContentsOfURL:fileURL error:nil];
    [self.player play];
}
@end
