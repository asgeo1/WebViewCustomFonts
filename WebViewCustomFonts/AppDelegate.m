//
//  AppDelegate.m
//  WebViewCustomFonts
//
//  Created by Nandeep Mali on 08/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize webView = _webView;
@synthesize localWebView = _localWebView;
@synthesize filePathField = _filePathField;

-(void)awakeFromNib
{
    [[NSNotificationCenter defaultCenter] 
     addObserver:self 
     selector:@selector(textDidEndEditing:)    
                        name:NSControlTextDidEndEditingNotification 
                        object:nil];
}

- (void)textDidEndEditing:(NSNotification *)aNotification
{
//    NSLog(@"%@", [[self filePathField] stringValue]);
    
    // Load the localWebView for local filesystem path
    NSURL* localFileURL = [NSURL fileURLWithPath:[[self filePathField] stringValue]];
    NSURLRequest* localFileRequest = [NSURLRequest requestWithURL:localFileURL];
    [[[self localWebView] mainFrame] loadRequest:localFileRequest];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    // Load the webView for index.html in resource bundle
    NSString *bundleFilePath = [[NSBundle mainBundle] pathForResource:@"index" 
                                                         ofType:@"html"];
    NSURL *bundleURL = [NSURL fileURLWithPath:bundleFilePath];
    NSURLRequest *bundleFileRequest = [NSURLRequest requestWithURL:bundleURL];
    [[[self webView] mainFrame] loadRequest:bundleFileRequest];
}

@end
