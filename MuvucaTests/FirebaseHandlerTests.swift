//
//  FirebaseHandlerTests.swift
//  MuvucaTests
//
//  Created by Danilo Araújo on 10/02/21.
//

import XCTest

class FirebaseHandlerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetCollection() {
        
        // given
        var blocks: [CarnivalBlock] = []
        let expectation = self.expectation(description: "Waiting for async operation")

        // when
        FirebaseHandler.readAllCollection(.carnavalBlock, dataType: [CarnivalBlock].self, completion: { result in
            if case .success(let resultBlocks) = result{
                blocks.append(contentsOf: resultBlocks.map{ $0 })
                expectation.fulfill()
            } else {
                XCTFail()
            }
        })
        
        self.waitForExpectations(timeout: 20, handler: nil)
        XCTAssertEqual(blocks.count, 4)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
