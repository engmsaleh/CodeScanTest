//
//  MainViewController.h
//  CodeScanTest
//
//  Created by Steven on 13-3-13.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZXingWidgetController.h>

@interface MainViewController : UIViewController <ZXingDelegate> {
    UITextView *resultsView;
    NSString *resultsToDisplay;
    
    NSMutableSet *qrReader;
    
}
@property (retain, nonatomic) IBOutlet UITextView *resultsView;
@property (nonatomic, copy) NSString *resultsToDisplay;

@property(retain, nonatomic) NSMutableSet *qrReader;

- (IBAction)scanPressed:(id)sender;

@end
