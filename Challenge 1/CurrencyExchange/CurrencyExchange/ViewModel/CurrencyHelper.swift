//
//  CurrencyHelper.swift
//  CurrencyExchange
//
//  Created by Phan Thien Quan on 21/11/24.
//

import Foundation

// check valid amount input
func isValidAmount(_ amount: String) -> Bool {
    //check positive num
    let amountRegex = "^[0-9]*\\.?[0-9]+$" // only allow positive num
    let predicate = NSPredicate(format: "SELF MATCHES %@", amountRegex)
    return predicate.evaluate(with: amount) && Double(amount) ?? 0 > 0
}

// calculate convert
func calculateConversion(amount: Double, fromRate: Double, toRate: Double) -> Double {
    return amount * (toRate / fromRate)
}

// get flag of each country
func getFlag(currency: String) -> String {
    let base = 127397
    let specialCurrencies: [String: String] = [
        "EUR": "🇪🇺", "XAU": "🟡", "XAG": "⚪", "BTC": "🪙",
        "XDR": "🌐", "XOF": "🌍", "XAF": "🌍", "ANG": "🇨🇼",
        "XCD": "🇦🇬", "XPF": "🇵🇫", "XPD": "Pd", "XPT": "Pt", "XBT": "🪙"
    ]

    if let specialSymbol = specialCurrencies[currency] {
        return "\(specialSymbol)"
    }

    let countryCode = currency.prefix(2)
    var scalar = String.UnicodeScalarView()

    for code in countryCode.utf16 {
        guard let unicodeScalar = UnicodeScalar(base + Int(code)) else {
            return "🏳️"
        }
        scalar.append(unicodeScalar)
    }

    return "\(String(scalar))"
}

// sort by Alphabet of each country
func sortedCurrencies(conversionData: [Currency]) -> [String] {
    return conversionData.map { $0.currencyName }.sorted()
}
