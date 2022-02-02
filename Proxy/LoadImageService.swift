//
//  LoadImageService.swift
//  Proxy
//
//  Created by Владимир Киселев on 02.02.2022.
//

import Foundation

class LoadImageService: LoadServiceProtocol{
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        
        let session = URLSession.init(configuration: config)
        
        session.dataTask(with: url, completionHandler: completion).resume()
    }
    
    
}
