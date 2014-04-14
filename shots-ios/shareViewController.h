//
//  shareViewController.h
//  shots-ios
//
//  Created by Bradley Dickason on 4/12/14.
//  Copyright (c) 2014 Bradley Dickason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shareViewController : UIViewController <UINavigationControllerDelegate> {

    IBOutlet UIImageView  *imageView;
    IBOutlet UITextField *urlTextField;
    IBOutlet UIButton *copyToClipboard;
    IBOutlet UIProgressView *progressBar;
}

@property(nonatomic) UIImage *image; // Passed in from previous view

@end
