//
//  PostMaskOperation.swift
//  TableView Handling Operations
//
//  Created by Ahmed Sultan  on 9/15/19.
//  Copyright © 2019 Ahmed Sultan . All rights reserved.
//

import Foundation
import UIKit

class PostMaskOperation: imageFilterationOperation {
    
    override func main() {
        guard let inputImage = filterInput else { return }
        
        filterOutput = postProcessImage(inputImage)
    }
}
class outputImageProvider : imageFilterationOperation{
   
    fileprivate let completion: (UIImage?) -> ()
    
    init(completion: @escaping (UIImage?) -> ()) {
        self.completion = completion
        super.init(image: nil)
    }
    
    override func main() {
        guard let inputImage = filterInput else { return }
       
        filterOutput = inputImage
        
        completion(filterOutput)
    }
}
