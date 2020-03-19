//
//  Webservice.swift
//  CryptoCrazy
//
//  Created by Atil Samancioglu on 19.03.2020.
//  Copyright © 2020 Atil Samancioglu. All rights reserved.
//

import Foundation

class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                
                let crytpoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                print(crytpoList)
                
                if let cryptoList = crytpoList {
                    completion(crytpoList)
                }
                
            }
            
        }.resume()
        
    }
    
}
