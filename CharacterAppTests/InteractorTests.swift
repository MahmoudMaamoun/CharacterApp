//
//  InteractorTests.swift
//  CharacterAppTests
//
//  Created by Mahmoud Maamoun on 07/05/2024.
//

import XCTest
@testable import CharacterApp



final class InteractorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testFetchingData() {
        let interactor = Interactor()
      
        let view = CharacterListVC()
        let presenter = CharList_Presenter(view: view, interactor: interactor, router: CharacterRouter())
        interactor.presenter = presenter
        interactor.getCharacterList()
        
        let expectaion = XCTestExpectation(description: "Data Loaded")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // verify that the interactor got data successfully for presenter
            XCTAssertGreaterThan(presenter.numOfRows,0)
            expectaion.fulfill()
        }
        wait(for: [expectaion], timeout: 3.0)
    }
    func testFilterByStatus(){
        
        // Assume we have a static data and want to filter them we have 5 alive , 1 unknown and 1 Dead
        let interactor = Interactor()
        let view = CharacterListVC()
        interactor.LoadDummyData()
        
        // let's filter by alive
        interactor.filterCharacterList(.alive)
        XCTAssertEqual(interactor.getFilteredList().count, 5)
        
        // dead
        interactor.filterCharacterList(.dead)
        XCTAssertEqual(interactor.getFilteredList().count, 1)
        
        // unknown
        interactor.filterCharacterList(.unknown)
        XCTAssertEqual(interactor.getFilteredList().count, 1)
       
        
    }
    func testFetchNextPage() {
        // This function will test the pagination by fetching a page with the interactor
        
        // Assume second page has 20 items fully so when interactor loads it
        // the presenter should present 40 items
        
        let interactor = Interactor()
        let view = CharacterListVC()
        let presenter = CharList_Presenter(view: view, interactor: interactor, router: CharacterRouter())
        
        interactor.presenter = presenter
        interactor.getCharacterList()
        interactor.getNextPage(page: 2)
        
        let expectaion = XCTestExpectation(description: "Data Loaded")
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(presenter.charList.count, 40)
            expectaion.fulfill()
        }
        wait(for: [expectaion],timeout: 3.0)
       
        
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
