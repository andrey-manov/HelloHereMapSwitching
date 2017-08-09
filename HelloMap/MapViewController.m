/***************************************************************
 * Copyright © 2011-2016 HERE Global B.V. All rights reserved. *
 **************************************************************/

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

#pragma mark - VC lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // Needed so that IB recognizes the class
    [NMAMapView class];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end
