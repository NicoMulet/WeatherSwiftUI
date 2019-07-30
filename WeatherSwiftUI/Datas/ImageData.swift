//
//  ImageData.swift
//  WeatherSwiftUI
//
//  Created by Nicolas Mulet on 28/07/2019.
//  Copyright © 2019 Nicolas Mulet. All rights reserved.
//

import SwiftUI
import UIKit
import Combine

final class ImageData: BindableObject {
    let willChange = PassthroughSubject<Void, Never>()
    var cancellable: AnyCancellable?
    
    let icon: String
    
    var image: UIImage? = nil {
        willSet {
            if newValue != nil {
                self.willChange.send()
            }
        }
    }
    
    init(icon: String) {
        self.icon = icon
    }
    
    func loadImage() {
        cancellable = ImageService.shared.fetchImage(icon: icon)
            .receive(on: DispatchQueue.main)
            .assign(to: \ImageData.image, on: self)
    }
    
    deinit {
        cancellable?.cancel()
    }
}
