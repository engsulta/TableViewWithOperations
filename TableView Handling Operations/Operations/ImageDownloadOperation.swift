//
//  ImageDownloadOperation.swift
//  TableView Handling Operations
//
//  Created by Ahmed Sultan  on 9/15/19.
//  Copyright © 2019 Ahmed Sultan . All rights reserved.
//

import Foundation
import UIKit

class ImageDownloadOperation: AsynchOperation {
  
    fileprivate var inputImageUrl : String?
    var completion : ((UIImage?) -> Void)?
    var outputImage : UIImage?
    
    init(inputImageUrl : String? , completion:  ((UIImage?) -> Void)? = nil) {
        
        
        self.inputImageUrl = inputImageUrl
        self.completion = completion
        super.init()
        
    }
    
    override func main() {
        guard !isCancelled else {return}
        
        if let imageinupt = inputImageUrl {
        NetworkSimulator.downloadImage(url: imageinupt) { (downloadedImage) in
            
            guard !self.isCancelled else {return}
            self.outputImage = downloadedImage
            self.completion?(downloadedImage)
            self.state = .finished
        }
        }else {
            self.state = .finished
        }
        
    }
}

extension ImageDownloadOperation: ImageFilterationOperationDataProvider {
    var image: UIImage? { return self.outputImage }
}

protocol ImageFilterationOperationDataProvider {
    var image: UIImage? { get}
}
