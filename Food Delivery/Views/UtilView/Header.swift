//
//  Header.swift
//  Food Delivery
//
//  Created by Tanaka Mazivanhanga on 6/27/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import UIKit
import Foundation

class Header: UICollectionReusableView{
    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame:frame)
        label.text =  "Categories"

        addSubview(label)
    }
    func configure(with title:String){
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.text = title
    }

    override func layoutSubviews() {
        label.frame = bounds
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
