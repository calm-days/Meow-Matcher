//
//  Meow_MatcherTests.swift
//  Meow MatcherTests
//
//  Created by Roman Liukevich on 3/12/23.
//

import XCTest
import Combine
@testable import Meow_Matcher

class Meow_MatcherTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subscriptions = []
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
    
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_breeds_success() {
        let result = Result<[Breed], APIError>.success([Breed.example1()])
        
        let fetcher = BreedFetcher(service: APIMockService(result: result))
        
        let promise = expectation(description: "getting breeds")
        
        fetcher.$breeds.sink { breeds in
            if breeds.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
       
        wait(for: [promise], timeout: 2)
    }
    
    
    func test_loading_error() {
       
         let result = Result<[Breed], APIError>.failure(APIError.badURL)
         let fetcher = BreedFetcher(service: APIMockService(result: result))
         
        let promise = expectation(description: "show error message")
        fetcher.$breeds.sink { breeds in
            if !breeds.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        
        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }

}
