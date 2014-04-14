//
//  shareViewController.m
//  shots-ios
//
//  Created by Bradley Dickason on 4/12/14.
//  Copyright (c) 2014 Bradley Dickason. All rights reserved.
//

#import "shareViewController.h"
#import "cfg/env.h"

#import "Parse/Parse.h"

@implementation shareViewController
@synthesize image;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [imageView setImage: image];
    
    [Parse setApplicationId:PARSE_APP_ID clientKey:PARSE_KEY];
    
    // Convert image to Parse File (PFFile)
    NSData *imageData = UIImageJPEGRepresentation(image, 0.05f);
    PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
    
    // Upload Image to server
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *err) {
        if(!err) {
            // Success!
            NSLog(@"Saved Image successfully!");
            
            // Create an object to represent the image in the database
            PFObject *imageObj = [PFObject objectWithClassName:@"Image"];
            [imageObj setObject:imageFile forKey:@"imageFile"];
            
            [imageObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *err) {
                if(!err) {
                    // Success!
                    NSLog(@"Saved object to database successfully");

                    // Update URL text field with image url: imageFile.url
                    urlTextField.text =imageFile.url;

                } else {
                    NSLog(@"Error: %@", err);
                }
            }];
        } else {
            NSLog(@"Error, %@", err);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
