//
//  ImagesTableViewController.swift
//  TableView Handling Operations
//
//  Created by Ahmed Sultan  on 9/15/19.
//  Copyright © 2019 Ahmed Sultan . All rights reserved.
//

import Foundation
import UIKit

class ImagesTableViewController: UITableViewController {
   
    fileprivate let imagesList = ImageModel.retrieveAllImages()
    var imageProviderList = Set<ImageProvider>()
    
    // TODO declar a provider list to store for each cell its provider for cancelling
    
    
    //Mark:- loading initialization
    override func viewDidLoad() {
        //TODO
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
        
        if let cell = cell as? ImageTableViewCell {
            cell.imageModel = imagesList[indexPath.row]
        }
        return cell
    }
}

extension ImagesTableViewController {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // TODO : init imageProvider and add it to list
        guard let cell = cell as? ImageTableViewCell else { return }
        
        if let imageprovider = imageProviderList.first(where: {(imageProvider) -> Bool in
            return imageProvider.imageModel.image != nil && imageProvider.imageModel == cell.imageModel
        }){
            OperationQueue.main.addOperation {
                cell.updateCell( imageprovider.imageModel.image)
            }
        }else {
            let imageProveder = ImageProvider(imageModel: imagesList[indexPath.row]) { image in
                
                OperationQueue.main.addOperation {
                    cell.updateCell(image)
                }
            }
            imageProviderList.insert(imageProveder)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let cell = cell as? ImageTableViewCell else { return }
        
        if let imageprovider = imageProviderList.first(where: {(imageProvider) -> Bool in
            return imageProvider.imageModel == cell.imageModel
        }){
        
            imageprovider.cancel()
           // imageProviderList.remove(imageprovider)
        }
    }
}
