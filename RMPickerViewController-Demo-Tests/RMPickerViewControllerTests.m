//
//  RMPickerViewController_Demo_Tests.m
//  RMPickerViewController-Demo-Tests
//
//  Created by Roland Moers on 21.06.15.
//  Copyright (c) 2015 Roland Moers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "RMPickerViewController.h"

@interface RMPickerViewControllerTests : XCTestCase

@end

@implementation RMPickerViewControllerTests

#pragma mark - Helper
- (RMPickerViewController *)createDateSelectionViewControllerWithStyle:(RMActionControllerStyle)aStyle {
    RMAction *selectAction = [RMAction actionWithTitle:@"Select" style:RMActionStyleDone andHandler:nil];
    RMAction *cancelAction = [RMAction actionWithTitle:@"Cancel" style:RMActionStyleCancel andHandler:nil];
    
    RMPickerViewController *pickerController = [RMPickerViewController actionControllerWithStyle:aStyle];
    pickerController.title = @"Test";
    pickerController.message = @"This is a test message.\nPlease choose a row and press 'Select' or 'Cancel'.";
    
    [pickerController addAction:selectAction];
    [pickerController addAction:cancelAction];
    
    return pickerController;
}

- (void)presentAndDismissController:(RMActionController *)aController {
    XCTestExpectation *expectation = [self expectationWithDescription:@"PresentationCompleted"];
    
    BOOL catchedException = NO;
    @try {
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:aController animated:YES completion:^{
            [expectation fulfill];
        }];
    }
    @catch (NSException *exception) {
        catchedException = YES;
    }
    @finally {
        XCTAssertFalse(catchedException);
    }
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
    
    expectation = [self expectationWithDescription:@"DismissalCompleted"];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:^{
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
}

#pragma mark - Tests
- (void)testPresentingMapActionController {
    RMPickerViewController *controller = [self createDateSelectionViewControllerWithStyle:RMActionControllerStyleWhite];
    
    XCTAssertNotNil(controller.contentView);
    XCTAssertEqual(controller.contentView, controller.picker);
    XCTAssertTrue([controller.contentView isKindOfClass:[UIPickerView class]]);
    
    [self presentAndDismissController:controller];
}

@end
