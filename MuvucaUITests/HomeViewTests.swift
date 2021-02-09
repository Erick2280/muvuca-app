//
//  HomeViewTests.swift
//  MuvucaUITests
//
//  Created by Danilo Araújo on 09/02/21.
//

import XCTest

class HomeViewTests: XCTestCase {
    
    let app: XCUIApplication = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launch()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCarnivalBlockList() throws{
        
        let blockTitle = app.staticTexts["CarnivalBlockTitle"]
        let blockHour = app.staticTexts["CarnivalBlockHour"]
        let blockLocation = app.staticTexts["CarnivalBlockLocation"]
        let goToProfileButton = app.buttons.firstMatch
        
        XCTAssertEqual(blockTitle.label, "Siri na lata")
        XCTAssertEqual(blockHour.label, "09:00")
        XCTAssertEqual(blockLocation.label, "Rua da moeda")
        XCTAssert(goToProfileButton.exists)
        
        
        
        
    }
    
    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
