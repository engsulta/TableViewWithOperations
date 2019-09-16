//
//  NetworkSimulator.swift
//  TableView Handling Operations
//
//  Created by Ahmed Sultan  on 9/15/19.
//  Copyright © 2019 Ahmed Sultan . All rights reserved.
//

import Foundation
import UIKit

struct NetworkSimulator {
    
    static func downloadImage(url imagename : String , completion : @escaping (UIImage?)->Void ){
        
        DispatchQueue.global(qos: .background).async {
            let image = synchDownload(imageName : imagename)
            
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    static func synchDownload(imageName: String) -> UIImage?{
        let randomWaitingTime = arc4random_uniform(2 * 1000000)
        usleep(randomWaitingTime)
        return UIImage(named: imageName)
    }
}


