//
//  LoadServiceProtocol.swift
//  Proxy
//
//  Created by Владимир Киселев on 02.02.2022.
//

import Foundation

protocol LoadServiceProtocol{
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}
