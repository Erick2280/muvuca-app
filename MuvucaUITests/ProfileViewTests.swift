//
//  ProfileViewTests.swift
//  MuvucaUITests
//
//  Created by Alanis Lima Santa Clara on 10/02/21.
//

import XCTest

class ProfileViewTests: XCTestCase {

    let app: XCUIApplication = XCUIApplication()

    override func setUpWithError() throws {
        
        app.launch()

        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testLocationMap() throws{
        
        let openProfileButton = app.buttons["openProfileButton"]
        openProfileButton.tap()
        
        let map = app.maps.firstMatch
        
        XCTAssert(map.exists, "") 
    }
        
        
        
        
        
    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
