//
//  RouterTests.swift
//  CharacterAppTests
//
//  Created by Mahmoud Maamoun on 07/05/2024.
//

import XCTest
@testable import CharacterApp
final class RouterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    //MARK: - ROUTER OPEN DETAILS SCREEN - ASSERT MOVING THERE
    func testNavigateToDetailsScreen() {
        let router = CharacterRouter()
        let view = CharacterListVC()
        router.viewController = view
        let itm = CharacterMModel(id: 0, name: "Bonque", status: "Alive", species: "", type: "", gender: "Male", origin: .init(name: "", url: ""), location:.init(name: "", url: ""), image: "", episode: [""], url: "", created: "")
        router.navigateToItemDetails(item: CharacterViewModel(with: itm))
        
        XCTAssertTrue(view.didNavigateToItemDetails)
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
