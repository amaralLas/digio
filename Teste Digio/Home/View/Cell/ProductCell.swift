//
//  ProductCell.swift
//  Teste Digio
//
//  Created by Leonardo Amaral Sousa on 03/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imgCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(item: HomeModel.Product) {
        viewCell.
        viewCell.layer.shadowColor = UIColor.black.cgColor
        viewCell.layer.shadowOpacity = 1
        viewCell.layer.shadowOffset = .zero
        viewCell.layer.shadowRadius = 3.0
        viewCell.clipsToBounds = true
        if let url = item.imageURL {
            imgCell.kf.setImage(with: URL(string: url))
        }
    }
}
