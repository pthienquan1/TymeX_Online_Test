//
//  Conversion.swift
//  CurrencyExchange
//
//  Created by Phan Thien Quan on 19/11/24.
//

import Foundation
//fetch data
struct Conversion: Decodable {
    var rates: [String: Double]
    var date: String
    var base: String
}
