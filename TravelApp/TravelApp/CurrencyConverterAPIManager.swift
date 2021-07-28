//
//  CurrencyConverterAPIManager.swift
//  TravelApp
//
//  Created by Lluís Masdeu on 23/01/2020.
//  Copyright © 2020 Lluís Masdeu. All rights reserved.
//

import Foundation
import Alamofire

// Documentació: https://exchangeratesapi.io
private let baseURL = "https://api.exchangeratesapi.io/latest"

class CurrencyConverterAPIManager {
    static let shared = CurrencyConverterAPIManager()
    
    init() {}
    
    func requestCurrencyConverted(from: String, to: String, callback: @escaping (_ data: CurrencyConverterResponseData) -> Void) {
        print("\(baseURL)&base=\(from)&symbols=\(to)")
        
        AF.request(baseURL, method: .get, parameters: ["base": from, "symbols": to]).validate().responseJSON { response in
            // Defining the object in charge of storing the data of the response
            var responseData: CurrencyConverterResponseData = CurrencyConverterResponseData()
            
            // Setting the 404 error code as a placeholder
            responseData.status = false
            print("\(response.error)")
            
            // Checking any possible errors
            if response.error != nil {
                print("THERE'S BEEN SOME ERROR")
            } else {
                if response.response?.statusCode == 200 {
                    if let data = response.data {
                        if let jsonString = String(data: data, encoding: .utf8) {
                            if let jsonData = jsonString.data(using: .utf8) {
                                let decoder = JSONDecoder()
                                
                                // Decoding the JSON with the response
                                responseData = try! decoder.decode(CurrencyConverterResponseData.self, from: jsonData)
                                
                                responseData.status = true
                            }
                        }
                    }
                }
            }
            
            // Calling the callback function with the response data parsed
            callback(responseData)
        }
    }
}
