//
//  CollectionViewCell.swift
//  Dourouss
//
//  Created by Moustapha Kebe on 23/09/2018.
//  Copyright © 2018 KEBE. All rights reserved.
//

import UIKit

class CollectionViewCell:  UICollectionViewCell {    
    @IBOutlet var khassidaImage: UIImageView!
    @IBOutlet var khassidaLabel: UILabel!
    
    func displayContent(image: UIImage, title: String) {
            khassidaImage.image = image
            khassidaLabel.text = title
    }
    
}
