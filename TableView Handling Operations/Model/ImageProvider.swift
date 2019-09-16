//
//  ImageProvider.swift
//  TableView Handling Operations
//
//  Created by Ahmed Sultan  on 9/15/19.
//  Copyright © 2019 Ahmed Sultan . All rights reserved.
//

import Foundation
import UIKit



class ImageProvider {
    
    var operationQueue = OperationQueue()
    
    var imageModel: ImageModel
    
    init(imageModel: ImageModel ,completion: @escaping (UIImage?)->Void ) {
        
        self.imageModel = imageModel
        
        // Create separations options
        // 1 download operation
        let asynchronousDowloadOperation = ImageDownloadOperation(inputImageUrl: imageModel.imageName)
       
        // 2 tiltshift operation
        let tiltshiftOperation = TiltShiftOperation(image: nil)
       
        
        // 3  post process operation
        let postProcessImageOperation = PostMaskOperation(image: nil)
        
        //TODO we can add completion block to wait untill it finishes
//        postProcessImageOperation.completionBlock = {
//            postProcessImageOperation.filterOutput
//        }
        // OR we can add another operation
        
        let outputOperation = outputImageProvider(completion: completion)
        outputOperation.completionBlock = {
            self.imageModel.image = outputOperation.filterOutput
           // completion(outputOperation.filterOutput)
        }
        let operations = [asynchronousDowloadOperation,tiltshiftOperation,postProcessImageOperation,outputOperation]
        
        // link all dependencies
        tiltshiftOperation.addDependency(asynchronousDowloadOperation)
        postProcessImageOperation.addDependency(tiltshiftOperation)
        outputOperation.addDependency(postProcessImageOperation)
        
        // start operations
        //operationQueue.addOperations(operations, waitUntilFinished: false)
        operationQueue.addOperation(asynchronousDowloadOperation)
        operationQueue.addOperation(tiltshiftOperation)
        operationQueue.addOperation(postProcessImageOperation)
        operationQueue.addOperation(outputOperation)
    }
   
    
    func cancel(){
        operationQueue.cancelAllOperations()
    }
    
}

extension ImageProvider: Hashable {
    var hashValue: Int {
        return ((imageModel.imageTitle ?? "") + (imageModel.imageName ?? "")).hashValue
    }
}

extension ImageProvider :  Equatable{
    static func ==(lhs: ImageProvider, rhs: ImageProvider) -> Bool {
        return lhs.imageModel == rhs.imageModel
    }
}



