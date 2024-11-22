//
//  MockURLSession.swift
//  CurrencyExchange
//
//  Created by Phan Thien Quan on 21/11/24.
//

import Foundation

// Mock URLSession for not calling original API
class MockURLSession: URLSession {
    var data: Data?
    var error: Error?

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        //fake return data or error
        completionHandler(data, nil, error)
        
        // retun empty URLSessionDataTask
        return MockURLSessionDataTask()
    }
}

// Mock URLSessionDataTask because we are not actually executing the network task in the unit test
class MockURLSessionDataTask: URLSessionDataTask {
    override func resume() {
        // for not meeting erorr
    }
}
