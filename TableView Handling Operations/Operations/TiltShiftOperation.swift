//
//  TiltShiftOperation.swift
//  TableView Handling Operations
//
//  Created by Ahmed Sultan  on 9/15/19.
//  Copyright © 2019 Ahmed Sultan . All rights reserved.
//

import Foundation

class TiltShiftOperation : imageFilterationOperation {
    
    override func main() {
        guard let inputImage = filterInput else { return }
        
        let mask = topAndBottomGradient(inputImage.size)
        filterOutput = inputImage.applyBlurWithRadius(5, maskImage: mask)
    }
}
