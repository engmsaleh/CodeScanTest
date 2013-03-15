//
//  MainViewController.m
//  CodeScanTest
//
//  Created by Steven on 13-3-13.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "MainViewController.h"
#import <QRCodeReader.h>
#import <Decoder.h>
#import <TwoDDecoderResult.h>

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize resultsView;
@synthesize resultsToDisplay;
@synthesize qrReader;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.qrReader = [[NSMutableSet alloc] init];
    QRCodeReader *qrcodeReader = [[QRCodeReader alloc] init];
    [self.qrReader addObject:qrcodeReader];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scanPressed:(id)sender
{
//    ZXingWidgetController *widController = [[ZXingWidgetController alloc] initWithDelegate:(id)self showCancel:YES OneDMode:NO];
//    NSMutableSet *readers = [[NSMutableSet alloc] init];
//    QRCodeReader * qrcodeReader = [[QRCodeReader alloc] init];
//    [readers addObject:qrcodeReader];
//    [qrcodeReader release];
//    widController.readers = readers;
//    [readers release];
//    widController.soundToPlay = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"beep-beep" ofType:@"aiff"] isDirectory:NO];
//    [self presentViewController:widController animated:YES completion:^{
//        
//    }];
//    [widController release];
    
    UIImage *image = [UIImage imageNamed:@"qrcode.png"];
    Decoder *decoder = [[Decoder alloc] init];
    decoder.readers = self.qrReader;
    decoder.delegate = (id)self;
    [decoder decodeImage:image];
}

- (void)zxingController:(ZXingWidgetController *)controller didScanResult:(NSString *)result
{
    self.resultsToDisplay = result;
    if (self.isViewLoaded) {
        [resultsView setText:resultsToDisplay];
        [resultsView setNeedsDisplay];
    }
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}
- (void)zxingControllerDidCancel:(ZXingWidgetController *)controller
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)decoder:(Decoder *)decoder willDecodeImage:(UIImage *)image usingSubset:(UIImage *)subset
{
    
}
- (void)decoder:(Decoder *)decoder didDecodeImage:(UIImage *)image usingSubset:(UIImage *)subset withResult:(TwoDDecoderResult *)result
{
    NSLog(@"result = %@", [result text]);
    [resultsView setText:[result text]];
    [resultsView setNeedsDisplay];
}
- (void)decoder:(Decoder *)decoder failedToDecodeImage:(UIImage *)image usingSubset:(UIImage *)subset reason:(NSString *)reason
{
    NSLog(@"%@", @"Failed to decode image!");
}
- (void)decoder:(Decoder *)decoder foundPossibleResultPoint:(CGPoint)point
{
    
}

@end
