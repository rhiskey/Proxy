//
//  Proxy.swift
//  Proxy
//
//  Created by Владимир Киселев on 02.02.2022.
//

import Foundation

var cacheData: Data? //userdefaults

class Proxy: LoadServiceProtocol{
    private var service: LoadServiceProtocol
    
    init(service: LoadServiceProtocol){
        self.service = service
    }
    
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        if cacheData == nil {
            service.loadImage(url: url){
                (data, response, error) in
                cacheData = data
                completion(data, response, error)
            }
        } else {
            completion(cacheData, nil, nil)
        }
    }
    
}
