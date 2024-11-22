//
//  CurrencyTest.swift
//  CurrencyExchangeTests
//
//  Created by Phan Thien Quan on 21/11/24.
//

import XCTest
@testable import CurrencyExchange

final class CurrencyTests: XCTestCase {

    func testCurrencyInitialization() {
        let currency = Currency(currencyName: "USD", currencyValue: 1.0)

        XCTAssertEqual(currency.currencyName, "USD", "Currency name should be USD.")
        XCTAssertEqual(currency.currencyValue, 1.0, "Currency value should be 1.0.")
    }

    func testCurrencyIdUniqueness() {
        let currency1 = Currency(currencyName: "USD", currencyValue: 1.0)
        let currency2 = Currency(currencyName: "EUR", currencyValue: 0.85)

        XCTAssertNotEqual(currency1.id, currency2.id, "Currency IDs should be unique.")
    }
}
