//
//  DataManager.swift
//  3homework4m
//
//  Created by mavluda on 21/4/23.
//

import Foundation

class DataManager{
    
    static let shared = DataManager()
    
    func downloadProducts(completed: @escaping([Product]) -> ()) {
        let url = URL(string: "https://dummyjson.com/products")
        
        URLSession.shared.dataTask(with: url!) { (data, urlResponse, error) in
            if error == nil {
                do {
                    let response = try JSONDecoder().decode(Products.self, from: data!)
                    DispatchQueue.main.async {
                        completed(response.products)
                    }
                } catch {
                    print("JSON Error")
                    print(error.localizedDescription)
                }
            }
        }.resume()
        
    }
    
}
