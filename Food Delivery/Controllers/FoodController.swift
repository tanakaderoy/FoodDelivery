//
//  FoodController.swift
//  Food Delivery
//
//  Created by Tanaka Mazivanhanga on 6/27/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class FoodController:  UICollectionViewController {


    private let cellID = "cellId"
    static let categoryHeaderId = "categoryHeaderId"
    let headerID = "headerID"
    let heroCellID = "heroCellId"
    let categoryCellId = "categoryCellId"
    let messageCellId = "messageeCellId"
    let itemCellId = "itemCellId"


    init() {
        super.init(collectionViewLayout: FoodController.createLayout())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor(hexString: "#F4F3F4")
        navigationItem.title = "Food Delivery"
        collectionView.register(HostingCollectionViewCell.self, forCellWithReuseIdentifier: heroCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(Header.self, forSupplementaryViewOfKind: FoodController.categoryHeaderId, withReuseIdentifier: headerID)
        collectionView.register(CategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: categoryCellId)
        collectionView.register(HostingCollectionViewCell.self, forCellWithReuseIdentifier: messageCellId)
        collectionView.register(ItemCollectionViewCell.nib(), forCellWithReuseIdentifier: itemCellId)
    }





    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 1{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! Header
            header.configure(with: "Category")
            return header
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! Header
        header.configure(with: "Food")
        return header

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return heroData.count
        case 1:
            return categoryData.count
        case 2:
            return messageData.count
        case 3:
            return itemData.count
        default:
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIViewController()
        controller.view.backgroundColor = indexPath.section == 0 ? .yellow : .blue
        switch indexPath.section {
        case 0:
            controller.title = heroData[indexPath.row].title

        case 1:
            controller.title = categoryData[indexPath.row].name

        case 2:
            controller.title = messageData[indexPath.row].title

        case 3:
            controller.title = itemData[indexPath.row].itemName

        default:
            break
        }
        navigationController?.pushViewController(controller, animated: true)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0:
            //Could use a custom object to hold title, call to action and image: Chipotle, save 10%, burrito.jpg etc
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: heroCellID, for: indexPath) as? HostingCollectionViewCell else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
                cell.backgroundColor = .green
                return cell
            }
            cell.host(UIHostingController(rootView: HeroView(data: heroData[indexPath.row])))
            return cell
        case 1:
            //categories custom object with name and image
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId, for: indexPath) as? CategoryCollectionViewCell else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
                cell.backgroundColor = .green
                return cell
            }
            //            cell.host(UIHostingController(rootView: CategoryView(data: categoryData[indexPath.row])))
            let data = categoryData[indexPath.row]
            cell.configure(with: UIImage(named: data.image.rawValue)!, title: data.name)
            cell.backgroundColor = .white
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: messageCellId, for: indexPath) as? HostingCollectionViewCell else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
                cell.backgroundColor = .green
                return cell
            }
            cell.host(UIHostingController(rootView: MessageView(data: messageData[indexPath.row])))
            cell.backgroundColor = .clear
            return cell
        case 3:
            //
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: itemCellId, for: indexPath) as? ItemCollectionViewCell else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
                cell.backgroundColor = .green
                return cell
            }
            let data = itemData[indexPath.row]
            cell.configure(with: UIImage(named: data.image.rawValue)!, itemName: data.itemName, subTitle: data.subTitlem, price: data.price, hotOrNot: data.hotOrNot)
            cell.backgroundColor = .white
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
            cell.backgroundColor = .white
            return cell
        }


    }



    static func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            switch sectionNumber {
            case 0:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
                item.contentInsets.bottom = 0
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                return section
            case 1:
                let item = NSCollectionLayoutItem(layoutSize:
                    .init(widthDimension: .fractionalWidth(0.25),
                          heightDimension: .absolute(150)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderId, alignment: .topLeading)
                ]
                return section

            case 2:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 32
                item.contentInsets.bottom = 0
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(125)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16

                return section

            case 3:

                let item = NSCollectionLayoutItem(layoutSize:
                    .init(widthDimension: .fractionalWidth(0.5),
                          heightDimension: .absolute(300)))
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])

                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.top = 0
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderId, alignment: .topLeading)
                ]
                return section
            default:
                return nil
            }

        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
