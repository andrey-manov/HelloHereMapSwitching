//
//  ContainingViewController.m
//  HelloMap
//
//  Created by Andrey Manov on 03/08/2017.
//  Copyright © 2017 HERE. All rights reserved.
//

#import "ContainingViewController.h"

@interface ContainingViewController ()

@property (nonatomic, weak) IBOutlet UIView* containerView;
@property (nonatomic) UIViewController *frontViewController;
@property (nonatomic) BOOL isMapVisible;

@end

@implementation ContainingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIStoryboard* sb = self.storyboard;
//    UIViewController* vc = [sb instantiateViewControllerWithIdentifier:@"MapViewControllerStoryboardID"];
////    [self _performTransitionWithViewController:vc animated:NO];
//    [self performSimpleTransitionWithViewController:vc];
//    self.isMapVisible = YES;
    
    UIViewController* vc = [sb instantiateViewControllerWithIdentifier:@"SomeOtherStoryboardID"];
    [self performSimpleTransitionWithViewController:vc];
    self.isMapVisible = NO;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchBtnPressed:(UIButton *)sender {
    
    UIStoryboard* sb = self.storyboard;
    UIViewController* vc;
    
    if (!self.isMapVisible) {
        vc = [sb instantiateViewControllerWithIdentifier:@"MapViewControllerStoryboardID"];
//        vc = [sb instantiateViewControllerWithIdentifier:@"SomeStoryboardID"];
    } else {
        vc = [sb instantiateViewControllerWithIdentifier:@"SomeOtherStoryboardID"];        
    }
//    [self _performTransitionWithViewController:vc animated:NO];
    [self performSimpleTransitionWithViewController:vc];
    self.isMapVisible = !self.isMapVisible;
}

#pragma mark - Adopted methods

- (void)performSimpleTransitionWithViewController:(UIViewController*)new
{
    UIViewController* fromController = self.frontViewController;
    UIViewController* toController = new;
    self.frontViewController = new;
    
    [self addChildViewController:toController];
    
    CGRect frame = self.containerView.bounds;
    UIView *toControllerView = toController.view;
    toControllerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    toControllerView.frame = frame;
    [self.containerView addSubview:toControllerView];
    
    [fromController willMoveToParentViewController:nil];
    [fromController.view removeFromSuperview];
    [fromController removeFromParentViewController];
    
    [toController didMoveToParentViewController:self];
}

@end
