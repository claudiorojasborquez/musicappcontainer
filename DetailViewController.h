//
//  DetailViewController.h
//  the complete musician mvp 1
//
//  Created by Claudio Rojas on 7/18/16.
//  Copyright © 2016 Claudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSString *filePath;
@property (strong) AVAudioPlayer *player;

- (IBAction)touchDownButton:(id)sender;
@end
