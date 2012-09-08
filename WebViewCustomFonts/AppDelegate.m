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
    NSString *path = [[self filePathField] stringValue];
    path = [path stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [[self filePathField] setStringValue:path];
    
    // Load the localWebView for local filesystem path
    NSURL* localFileURL = [NSURL fileURLWithPath:path];
    NSURLRequest* localFileRequest = [NSURLRequest requestWithURL:localFileURL];
    [[[self localWebView] mainFrame] loadRequest:localFileRequest];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    // Load the webView for index.html in resource bundle
    [[[self webView] mainFrame] loadRequest:[self getURLRequestForResource:@"index" ofType:@"html"]];
    
    // Load the localWebView for local filesystem path
    [[[self localWebView] mainFrame] loadRequest:[self getURLRequestForResource:@"intro" ofType:@"html"]];
}

- (void)webView:(WebView *)sender resource:(id)identifier didFailLoadingWithError:(NSError *)error fromDataSource:(WebDataSource *)dataSource
{
    // Show error
    [[[self localWebView] mainFrame] loadRequest:[self getURLRequestForResource:@"404" ofType:@"html"]];
}

-(NSURLRequest *)getURLRequestForResource:(NSString *)fileName ofType:(NSString *)type
{
    NSString *bundleFilePath = [[NSBundle mainBundle] pathForResource:fileName
                                                               ofType:type];
    NSURL *bundleURL = [NSURL fileURLWithPath:bundleFilePath];
    NSURLRequest *bundleFileRequest = [NSURLRequest requestWithURL:bundleURL];

    return bundleFileRequest;
}
@end
