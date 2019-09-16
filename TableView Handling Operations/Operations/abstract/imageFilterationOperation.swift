//
//  imageFilterationOperation.swift
//  TableView Handling Operations
//
//  Created by Ahmed Sultan  on 9/15/19.
//  Copyright © 2019 Ahmed Sultan . All rights reserved.
//

import UIKit
import Foundation

class imageFilterationOperation: Operation {
   
    var filterOutput: UIImage?
    fileprivate let _filterInput: UIImage?
    
    init(image: UIImage?) {
        _filterInput = image
        super.init()
    }
    
    var filterInput: UIImage? {
        var image: UIImage?
        if let inputImage = _filterInput {
            image = inputImage
        } else if let dataProvider = dependencies
            .filter({ $0 is ImageFilterationOperationDataProvider })
            .first as? ImageFilterationOperationDataProvider {
            image = dataProvider.image
        }
        return image
    }
    
}


extension imageFilterationOperation: ImageFilterationOperationDataProvider {
    var image: UIImage? {
        return filterOutput
    }
}


