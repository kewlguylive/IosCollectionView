//
//  PictureCell.swift
//  CollectionView
//
//  Created by preetham uppu on 6/28/15.
//  Copyright (c) 2015 preetham uppu. All rights reserved.
//

import Foundation
import UIKit

class PictureCell: UICollectionViewCell{
    
   
    @IBOutlet weak var coverImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       coverImageView.layer.borderColor = UIColor(white: 0.2, alpha: 1.0).CGColor
        coverImageView.layer.borderWidth = 0.5
       
        
    }
}
