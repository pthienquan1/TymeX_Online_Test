//
//  ConversionTest.swift
//  CurrencyExchangeTests
//
//  Created by Phan Thien Quan on 21/11/24.
//

import XCTest
@testable import CurrencyExchange

final class ConversionTests: XCTestCase {

    func testConversionDecoding() {
        let jsonData = """
        {
            "rates": {
                "USD": 1.0,
                "EUR": 0.85
            },
            "date": "2024-11-19",
            "base": "USD"
        }
        """.data(using: .utf8)!

        do {
            let conversion = try JSONDecoder().decode(Conversion.self, from: jsonData)

            XCTAssertEqual(conversion.rates["USD"], 1.0, "USD rate should be 1.0")
            XCTAssertEqual(conversion.rates["EUR"], 0.85, "EUR rate should be 0.85")
            XCTAssertEqual(conversion.date, "2024-11-19", "Date should match the provided date")
            XCTAssertEqual(conversion.base, "USD", "Base currency should be USD")

        } catch {
            XCTFail("Failed to decode Conversion: \(error)")
        }
    }

   
}
