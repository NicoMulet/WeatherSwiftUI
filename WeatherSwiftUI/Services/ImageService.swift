//
//  ImageService.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 28/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import UIKit

class ImageService {
    static let shared = ImageService()
    private static let cacheQueue = DispatchQueue(label: "cacheQueue")
    
    var memCache = NSCache<NSString, UIImage>()
    
    func path(icon: String) -> URL {
        return URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")!
    }
    
    enum ImageError: Error {
        case decodingError
    }
    
    func syncImageFromCache(icon: String) -> UIImage? {
        return memCache.object(forKey: icon as NSString)
    }
    
    func fetchImage(icon: String) -> AnyPublisher<UIImage?, Never> {
        if let cached = memCache.object(forKey: icon as NSString) {
            return Just(cached).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: path(icon: icon)).tryMap { (data, response) -> UIImage? in
            let image = UIImage(data: data)
            if let image = image {
                self.memCache.setObject(image, forKey: icon as NSString)
            }
            
            return image
        }.catch { error in
            return Just(nil)
        }
        .eraseToAnyPublisher()
    }
}
