//
//  ItemCollectionViewCell.swift
//  Food Delivery
//
//  Created by Tanaka Mazivanhanga on 6/26/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var hotOrNotLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        subTitleLabel.textColor = .secondaryLabel
        itemNameLabel.textColor = .label
        priceLabel.textColor = .label

    }

    public func configure(with image: UIImage, itemName: String, subTitle: String, price:String, hotOrNot: String){
        imageView.image = image
        itemNameLabel.text = itemName
        subTitleLabel.text = subTitle
        priceLabel.text = price
        hotOrNotLabel.text = hotOrNot
    }

    static func nib() -> UINib {
        return UINib(nibName: "ItemCollectionViewCell", bundle: nil)
    }
}
