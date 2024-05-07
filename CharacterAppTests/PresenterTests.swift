//
//  PresenterTests.swift
//  CharacterAppTests
//
//  Created by Mahmoud Maamoun on 07/05/2024.
//

import XCTest
@testable import CharacterApp
final class PresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testtransformandPresentData() {
        // Assume we have an character item only is got and lets see the presenter get,present,transform it
        let chars = [CharacterMModel(id: 0, name: "Bonque", status: "", species: "", type: "", gender: "", origin: .init(name: "", url: ""), location:.init(name: "", url: ""), image: "", episode: [""], url: "", created: "")]
        
        let view = CharacterListVC()
        let presenter = CharList_Presenter(view: view, interactor: Interactor(), router: CharacterRouter())
        
        presenter.charListFetchedSuccessfully(charsList: chars, pages: 1)
        XCTAssertEqual(presenter.numOfRows, 1)
         
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
