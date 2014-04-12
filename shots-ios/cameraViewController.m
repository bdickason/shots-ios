//
//  shotsViewController.m
//  shots-ios
//
//  Created by Bradley Dickason on 4/12/14.
//  Copyright (c) 2014 Bradley Dickason. All rights reserved.
//

#import "cameraViewController.h"

#import "shareViewController.h"

@interface cameraViewController ()

@end

@implementation cameraViewController

- (void)viewDidAppear:(BOOL) Animated {
    // Wait for view to appear before accessing camera
    [super viewDidAppear:Animated];

    // Open camera and allow user to take a photo
    // We have to use performSelector here or there are issues with view manipulation
    [self performSelector:@selector(TakePhoto) withObject:nil afterDelay:0.3f];
}

- (IBAction)TakePhoto {
    // Opens the interface to snap a photo
    
    // Check if device has a camera connected
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        // No camera is available on the current device
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Device has no camera" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [myAlertView show];
        
    } else {
        // Camera is connected - load photo interface
        picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // User selected a photo
    
    // Store photo
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [imageView setImage: image];
    
    [self dismissViewControllerAnimated:YES completion:^{
        // Transition to Share view
        [self performSegueWithIdentifier: @"shareSegue" sender: self];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // User hit cancel - send them back to camera
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"shareSegue"]){
        shareViewController *controller = (shareViewController *)segue.destinationViewController;
        controller.image = image;
    }
}

@end
