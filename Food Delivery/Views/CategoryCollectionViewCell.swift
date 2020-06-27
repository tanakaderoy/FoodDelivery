//
//  CategoryCollectionViewCell.swift
//  Food Delivery
//
//  Created by Tanaka Mazivanhanga on 6/26/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(with image: UIImage, title: String){
        imageView.image = image
        titleLabel.text = title
    }

    static func nib() -> UINib {
        return UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    }
}
