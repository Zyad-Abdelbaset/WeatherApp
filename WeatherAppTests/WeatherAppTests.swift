//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by zyad Baset on 27/08/2024.
//

import XCTest
@testable import WeatherApp
final class WeatherAppTests: XCTestCase {

    var mock:MockNWService!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mock = MockNWService(shouldReturnError: false)
    }

    override func tearDownWithError() throws {
        mock=nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testMock(){
        mock.getData { loc, err in
            if let err = err {
                XCTFail()
            }else{
                XCTAssertNotNil(loc)
            }
        }
    }
    func testFetchData(){
        let myExp = expectation(description: "wait for fetching Data")
        NetWorkService().fetchData { data in
            XCTAssertNotNil(data, "Nil inside data")
            myExp.fulfill()
        }
        waitForExpectations(timeout: 2)
    }
    func testCountData(){
        let myExp = expectation(description: "wait for fetching Data")
        DataParser().parsingData(ClassType: WeatherResponse.self) { decodedData in
            XCTAssertEqual(decodedData.forecast.forecastday.count, 3)
            print(decodedData.forecast.forecastday.count )
            myExp.fulfill()
        }
        waitForExpectations(timeout: 2)
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
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
