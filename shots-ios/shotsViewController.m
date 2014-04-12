//
//  shotsViewController.m
//  shots-ios
//
//  Created by Bradley Dickason on 4/12/14.
//  Copyright (c) 2014 Bradley Dickason. All rights reserved.
//

#import "shotsViewController.h"

@interface shotsViewController ()

@end

@implementation shotsViewController

- (IBAction)TakePhoto {
    // Opens the interface to snap a photo
    
    // Check if device has a camera connected
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        // No camera is available on the current device
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    } else {
        // Camera is connected - load photo interface
        picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:
    // User selected a photo, handle it

    (NSDictionary *)info {
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [imageView setImage: image];    // Display the image
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // User hit cancel
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)viewWillAppear:(BOOL)animated {
    // Wait for view to appear before accessing camera
    [super viewWillAppear:YES];

    // Open camera and allow user to take a photo
    [self TakePhoto];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
