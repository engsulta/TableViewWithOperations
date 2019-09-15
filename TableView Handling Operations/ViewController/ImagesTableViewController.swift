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
