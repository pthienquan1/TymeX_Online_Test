//
//  FetchDataTests.swift
//  CurrencyExchangeTests
//
//  Created by Phan Thien Quan on 21/11/24.
//

import XCTest
@testable import CurrencyExchange
final class FetchDataTests: XCTestCase {

    var fetchData: FetchData!
       var mockSession: MockURLSession!

       override func setUp() {
           super.setUp()
           mockSession = MockURLSession()
           fetchData = FetchData(session: mockSession)
       }

       override func tearDown() {
           fetchData = nil
           mockSession = nil
           super.tearDown()
       }

       // fetch isSucess
    func testFetchDataSuccess() {
       
        // mock return
        let mockData = """
        {
            "rates": {
                "USD": 1.0,
                "EUR": 0.85
            }
        }
        """.data(using: .utf8)

        // assign mock to MockSession
        mockSession.data = mockData
        mockSession.error = nil

        // observe change
        let observer = fetchData.$conversionData.sink { data in
            if data.count == 2 {
                XCTAssertEqual(data[0].currencyName, "USD", "The first currency should be USD.")
                XCTAssertEqual(data[1].currencyName, "EUR", "The second currency should be EUR.")
                
            }
        }

        fetchData.fetch()

       
    }



    // fetch fail
    func testFetchDataFailure() {
        let expectation = self.expectation(description: "Error during fetch")

        // create err mock
        let mockError = NSError(domain: "NetworkError", code: 404, userInfo: nil)

        // assign error to mockSession
        mockSession.error = mockError
        mockSession.data = nil

        // observe
        let observer = fetchData.$conversionData.sink { data in
            if data.isEmpty {
                expectation.fulfill() // Khi conversionData rỗng, hoàn thành expectation
            }
        }

        fetchData.fetch()

        // wait 2 mins
        waitForExpectations(timeout: 2) { error in
            observer.cancel() // cancel observer when finish or timeout
        }

        // check empty conversionData
        XCTAssertEqual(fetchData.conversionData.count, 0, "The conversionData array should be empty if there is an error.")
    }

    // check empty api
    func testFetchDataEmptyResponse() {
        let expectation = self.expectation(description: "Data fetched with empty response")

        // Dữ liệu mock trống
        let mockData = """
        {
            "rates": {}
        }
        """.data(using: .utf8)

        // asign mock to mockSession
        mockSession.data = mockData
        mockSession.error = nil

        // observe
        let observer = fetchData.$conversionData.sink { data in
            if data.isEmpty {
                expectation.fulfill() // when conversionData is empty, finish expectation
            }
        }

        fetchData.fetch()

        // wait 2mins
        waitForExpectations(timeout: 2) { error in
            observer.cancel() //cancel observer when finish or timeout
        }

        // check empty
        XCTAssertEqual(fetchData.conversionData.count, 0, "The conversionData array should be empty if there are no rates.")
    }
}


