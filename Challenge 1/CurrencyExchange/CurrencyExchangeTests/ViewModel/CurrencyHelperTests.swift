//
//  CurrencyHelperTests.swift
//  CurrencyExchangeTests
//
//  Created by Phan Thien Quan on 21/11/24.
//

import XCTest
@testable import CurrencyExchange
final class CurrencyHelperTests: XCTestCase {

    func testIsValidAmount() {
        // Test valid values
        XCTAssertTrue(isValidAmount("100"), "Should return true for valid amount")
        XCTAssertTrue(isValidAmount("100.50"), "Should return true for valid amount with decimal")
            
        // Test invalid values
        XCTAssertFalse(isValidAmount("-100"), "Should return false for negative amount")
        XCTAssertFalse(isValidAmount("abc"), "Should return false for non-numeric characters")
        XCTAssertFalse(isValidAmount("100.abc"), "Should return false for amount with invalid decimal format")
    }

    func testCalculateConversion() {
        let amount: Double = 100
        let fromRate: Double = 1.0
        let toRate: Double = 2.0
            
        let result = calculateConversion(amount: amount, fromRate: fromRate, toRate: toRate)
            
        XCTAssertEqual(result, 200.0, "The conversion result should be correct")
    }

    
    func testGetFlag() {
        // Test for common currencíe
        XCTAssertEqual(getFlag(currency: "USD"), "🇺🇸", "The flag for USD should be 🇺🇸")
        XCTAssertEqual(getFlag(currency: "EUR"), "🇪🇺", "The flag for EUR should be 🇪🇺")
            
        // Test for special currencies
        XCTAssertEqual(getFlag(currency: "BTC"), "🪙", "The flag for BTC should be 🪙")
        XCTAssertEqual(getFlag(currency: "XAU"), "🟡", "The flag for XAU should be 🟡")
    }

    
    func testSortedCurrencies() {
        let currencies = [
                Currency(currencyName: "USD", currencyValue: 1.0),
                Currency(currencyName: "EUR", currencyValue: 0.85),
                Currency(currencyName: "GBP", currencyValue: 0.75)
        ]
            
        let sorted = sortedCurrencies(conversionData: currencies)
            
        XCTAssertEqual(sorted, ["EUR", "GBP", "USD"], "Currencies should be sorted alphabetically")
    }
}
