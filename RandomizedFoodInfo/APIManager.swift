//
//  APIManager.swift
//  Lifesum Challenge
//
//  Created by Marco Giustozzi on 2019-07-12.
//  Copyright © 2019 marcog. All rights reserved.
//

import Foundation

class APIManager {
    
    func getFood(urlString: String, completion: @escaping (_ food: CurrentFood?, _ error: Error?) -> Void) {
        getJSONFromURL(urlString: urlString) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completion(nil, error)
            }
            self.createFoodObjectWith(json: data, completion: { (food, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil, error)
                }
                return completion(food, nil)
            })
        }
    }
    
}

extension APIManager {
    private func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Cannot create URL from string")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("23863708:465c0554fd00da006338c72e282e939fe6576a25fd00c776c0fbe898c47c9876", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                print("Error calling api")
                return completion(nil, error)
            }
            
            guard let responseData = data else {
                print("Data is nil")
                return completion(nil, error)
            }
            completion(responseData, nil)
        }
        task.resume()
    }
    
    private func createFoodObjectWith(json: Data, completion: @escaping (_ data: CurrentFood?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            let food = try decoder.decode(CurrentFood.self, from: json)
            return completion(food, nil)
        } catch let error {
            print("Error creating current food from JSON because: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
    
}
