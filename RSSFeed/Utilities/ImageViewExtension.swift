//
//  ImageViewExtension.swift
//  RSSFeed
//
//  Created by Saiteja Alle on 9/17/20.
//  Copyright © 2020 Saiteja Alle. All rights reserved.
//

import Foundation
import UIKit.UIImage

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageUsingCache(withUrl urlString : String?) {
        guard let urlString = urlString else {
            return
        }
        self.image = nil
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }
        
        APIClient.loadImage(imageURL: urlString) { (data, apiError) in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            imageCache.setObject(image, forKey: urlString as NSString)
            self.image = image
            self.contentMode = .scaleAspectFit
            self.clipsToBounds = true
        }
        
    }
}
