shots-ios
=========

iOS app for Shots

# Installation

1. Install Xcode
2. Clone the repository: `git clone git@github.com:bdickason/shots-ios.git`
3. Enter the shots-ios directory: `cd shots-ios`
4. Install Cocoapods: `sudo gem install cocoapods`
5. Install dependencies: `pod install`
6. Open the files `shots-ios.xcworkspace` in Xcode (NOT shots-ios.xcodeproj)
7. Create a new file within Xcode at `/shots-ios/cfg/emv.m`
8. Paste in the following into the file:

````
// (ignored by git) Houses environment variables

#import "env.h"

NSString * const PARSE_KEY = @"YOUR_KEY_HERE";
NSString * const PARSE_APP_ID = @"YOUR_APP_ID_HERE";
````

8. Fill in your [Parse](http://parse.com/) key and app ID.


# Capture Image

Snapping a photo of a wireframe or sketch will cause it to be synced to Shots.

If you have the desktop app running, it will automagically copy the URL to your clipboard.