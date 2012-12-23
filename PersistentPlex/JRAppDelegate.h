//
//  JRAppDelegate.h
//  PersistentPlex
//
//  Created by James Reuss on 23/12/2012.
//  Copyright (c) 2012 James Reuss. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JRAppDelegate : NSObject <NSApplicationDelegate> {
	IBOutlet NSMenu *statusMenu;
	NSStatusItem *statusItem;
	IBOutlet NSMenuItem *infoItem;
	IBOutlet NSView *infoPane;
}

- (IBAction)quitApp:(id)sender;

@end
