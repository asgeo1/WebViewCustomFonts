//
//  AppDelegate.h
//  WebViewCustomFonts
//
//  Created by Nandeep Mali on 08/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <Webkit/Webkit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet WebView *webView;
@property (weak) IBOutlet WebView *localWebView;

@end
