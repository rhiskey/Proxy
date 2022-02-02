//
//  DetailViewController.swift
//  Proxy
//
//  Created by Владимир Киселев on 02.02.2022.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    
    let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_from_Silesia2.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
        
    }
    
    func loadImage() {
        let imageService = LoadImageService()
        let proxy = Proxy(service: imageService)
        
        proxy.loadImage(url: url) { [weak self] (data, response, error) in //memory leak fix
            guard let self = self, let data = data, error == nil else {return}
            DispatchQueue.main.async { //run from main thread
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        cacheData = nil
        imageView.image = nil
        loadImage()
    }
    
}
