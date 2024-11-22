//
//  Currency.swift
//  CurrencyExchange
//
//  Created by Phan Thien Quan on 19/11/24.
//

import Foundation
//display data
struct Currency: Identifiable{
    var id = UUID().uuidString
    var currencyName:String
    var currencyValue:Double
}
