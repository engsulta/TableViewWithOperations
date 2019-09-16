//
//  ImageModel.swift
//  TableView Handling Operations
//
//  Created by Ahmed Sultan  on 9/15/19.
//  Copyright © 2019 Ahmed Sultan . All rights reserved.
//

import Foundation
import UIKit

struct ImageModel {
    var imageName : String?
    var imageTitle : String?
    var image : UIImage?
    
    init(imageName : String , imageTitle: String , image : UIImage? = nil) {
        self.imageName = imageName
        self.imageTitle = imageTitle
        self.image = image
    }
    static func retrieveAllImages()-> [ImageModel] {
        return [ImageModel(imageName: "image0", imageTitle: "title0"),
                ImageModel(imageName: "image1", imageTitle: "title1"),
                ImageModel(imageName: "image2", imageTitle: "title2"),
                ImageModel(imageName: "image3", imageTitle: "title3")]
    }
}


extension ImageModel: Equatable {
    
    static func ==(lhs: ImageModel, rhs: ImageModel) -> Bool {
        return lhs.imageName == rhs.imageName && lhs.imageTitle == rhs.imageTitle
    }
}


