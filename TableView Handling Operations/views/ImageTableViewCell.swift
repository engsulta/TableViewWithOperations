//
//  ImageCell.swift
//  TableView Handling Operations
//
//  Created by Ahmed Sultan  on 9/15/19.
//  Copyright © 2019 Ahmed Sultan . All rights reserved.
//

import Foundation
import UIKit

class ImageTableViewCell: UITableViewCell {
    
    //MARK :- data declaration
    var imageModel : ImageModel?{
        didSet{
            if let imageModel = imageModel{
                tcLabel.text = imageModel.imageTitle
                updateCell(nil)
            }
         
        }
    }
    //MARK :- UI components declaration
    @IBOutlet fileprivate weak var tcImageView : UIImageView!
    @IBOutlet fileprivate weak var tcLabel: UILabel!
    
    @IBOutlet weak var tcActivityIndicator: UIActivityIndicatorView!
    
    //MARK :- cell setup
    
    func updateCell(_ image : UIImage?){
        
        if let image = image{
            tcImageView.image = image
            tcImageView.alpha = 0
            
            
            
            UIView.animate(withDuration: 0.2) {
                self.tcImageView.alpha = 1
                self.tcActivityIndicator.alpha = 0
            }
            
            tcActivityIndicator.stopAnimating()
            
        }else {
            tcImageView.image = nil
            tcImageView.alpha = 0
            tcActivityIndicator.alpha = 1
            tcActivityIndicator.startAnimating()
        }
    }
}
