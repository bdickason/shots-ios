//
//  cameraViewController.h
//  shots-ios
//
//  Created by Bradley Dickason on 4/12/14.
//  Copyright (c) 2014 Bradley Dickason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
    UIImagePickerController *picker;
    UIImage *image;
    IBOutlet UIImageView  *imageView;
}

- (IBAction)TakePhoto;

@end
