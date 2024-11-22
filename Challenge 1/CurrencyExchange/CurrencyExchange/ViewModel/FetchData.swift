//
//  FetchData.swift
//  CurrencyExchange
//
//  Created by Phan Thien Quan on 19/11/24.
//

import SwiftUI
import Foundation
class FetchData: ObservableObject {
    @Published var conversionData: [Currency] = []
    @Published var base = "USD"
    private var session: URLSession

        init(session: URLSession = URLSession.shared) {
            self.session = session
            fetch()
        }
    
    func fetch() {
        guard let url = URL(string: "https://api.apilayer.com/exchangerates_data/latest?base=\(base)") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.setValue("wKDPFjbJZaPoOQe7nTgpKlsYaa5ysaJG", forHTTPHeaderField: "apikey") // add apikey in header

        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            guard let JSONData = data else {
                print("No data received")
                return
            }

            do {
                let conversion = try JSONDecoder().decode(Conversion.self, from: JSONData)
                DispatchQueue.main.async {
                    self.conversionData = conversion.rates.compactMap { (key, value) -> Currency? in
                        return Currency(currencyName: key, currencyValue: value)
                    }
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
            }
        }
        .resume()
    }

    func updateData(base:String){
        self.base = base
        self.conversionData.removeAll()
        fetch()
    }

}


