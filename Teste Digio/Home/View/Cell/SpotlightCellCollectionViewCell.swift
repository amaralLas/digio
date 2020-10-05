//
//  SpotlightCellCollectionViewCell.swift
//  Teste Digio
//
//  Created by Leonardo Amaral Sousa on 03/10/20.
//  Copyright © 2020 Leonardo Amaral. All rights reserved.
//

import UIKit
import Kingfisher

class SpotlightCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setup(item: HomeModel.Spotlight) {
        if let url = item.bannerURL {
            let processor = RoundCornerImageProcessor(cornerRadius: 20)
            imgCell.kf.setImage(with: URL(string: url), options: [.processor(processor)])
        }
    }
}
