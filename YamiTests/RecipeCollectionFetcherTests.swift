//
//  RecipeCollectionFetcherTests.swift
//  YamiTests
//
//  Created by 贾金达 on 3/30/23.
//

import XCTest
import Combine
@testable import Yami

final class RecipeCollectionFetcherTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchData() async throws {
        let fetcher = RecipeCollectionFetcher()
        
        let expectation = XCTestExpectation(description: "Fetch data expectation")
        
        let cancellable = try await fetcher.fetchData()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    XCTFail("Error: \(error)")
                case .finished:
                    expectation.fulfill()
                    print("Publisher finished emitting values")
                }
            }, receiveValue: { value in
                print("Fetched data: \(fetcher.recipeCollection)")
            })
        
        wait(for: [expectation], timeout: 2.0)
        
        cancellable.cancel()
        
        XCTAssertGreaterThan(fetcher.recipeCollection.meals.count, 0)
    }


}
