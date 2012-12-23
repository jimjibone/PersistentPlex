//
//  JRAppDelegate.m
//  PersistentPlex
//
//  Created by James Reuss on 23/12/2012.
//  Copyright (c) 2012 James Reuss. All rights reserved.
//

#import "JRAppDelegate.h"

@interface JRAppDelegate ()
- (void)fileNotifications;
- (void)receiveSleepNote:(NSNotification*)note;
- (void)receiveWakeNote:(NSNotification*)note;
@end

@implementation JRAppDelegate

- (void)dealloc
{
	[statusItem release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
	
	statusItem = [[[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength] retain];
	[statusItem setMenu:statusMenu];
	[statusItem setTitle:@"PP"];
	[statusItem setHighlightMode:YES];
	
	[infoItem setView:infoPane];
	
	[self fileNotifications];
}

- (IBAction)quitApp:(id)sender {
	[NSApp terminate:self];
}

- (void)fileNotifications {
    //These notifications are filed on NSWorkspace's notification center, not the default
    // notification center. You will not receive sleep/wake notifications if you file
    //with the default notification center.
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver: self
														   selector: @selector(receiveSleepNote:)
															   name: NSWorkspaceWillSleepNotification object: NULL];
	
    [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver: self
														   selector: @selector(receiveWakeNote:)
															   name: NSWorkspaceDidWakeNotification object: NULL];
}

- (void)receiveSleepNote:(NSNotification*)note {
}
- (void)receiveWakeNote:(NSNotification*)note {
	if(![[NSWorkspace sharedWorkspace] launchApplication:@"Plex"]) {
		[statusItem setTitle:@"PP (Failed)"];
		NSLog(@"Plex failed to launch");
	} else {
		[statusItem setTitle:@"PP"];
	}
}

@end
