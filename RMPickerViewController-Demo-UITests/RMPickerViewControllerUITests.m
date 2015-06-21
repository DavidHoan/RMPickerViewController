//
//  RMPickerViewController_Demo_UITests.m
//  RMPickerViewController-Demo-UITests
//
//  Created by Roland Moers on 21.06.15.
//  Copyright © 2015 Roland Moers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

#import "RMPickerViewController.h"

@interface RMPickerViewControllerUITests : XCTestCase

@end

@implementation RMPickerViewControllerUITests

- (void)setUp {
    [super setUp];
    
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)testExample {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.tables.staticTexts[@"Show picker view controller…"] tap];
    
    XCTAssertNotNil(app.staticTexts[@"Test"]);
    XCTAssertNotNil(app.staticTexts[@"This is a test message. Please choose a row and press 'Select' or 'Cancel'."]);
    
    XCTAssertNotNil(app.pickerWheels[@"Row 0"]);
    XCTAssertNotNil(app.pickerWheels[@"Row 1"]);
    XCTAssertNotNil(app.pickerWheels[@"Row 2"]);
    XCTAssertNotNil(app.pickerWheels[@"Row 3"]);
    
    XCTAssertNotNil(app.buttons[@"Cancel"]);
    XCTAssertNotNil(app.buttons[@"Select"]);
    
    [app.buttons[@"Select"] tap];
}

@end
