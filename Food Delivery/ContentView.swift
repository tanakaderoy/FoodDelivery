//
//  ContentView.swift
//  Food Delivery
//
//  Created by Tanaka Mazivanhanga on 6/24/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import SwiftUI

class FoodController:  UICollectionViewController {
    let heroData = [HeroViewData.init(title: "Grab Some Jollof", cta: "Save 30%", backgroundColor: .black, image: "https://www.demandafrica.com/wp-content/uploads/2018/06/Nigerian-jollof.jpeg"),HeroViewData.init(title: "Grab Some Burgers", cta: "Save 30%", backgroundColor: .purple, image: "https://timeincsecure-a.akamaihd.net/rtmp_uds/429048911/202004/2769/429048911_6152425885001_6152427053001-vs.jpg?pubId=429048911&videoId=6152427053001"),HeroViewData.init(title: "Grab Some Pasta", cta: "Save 30%", backgroundColor: .yellow, image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190305-lemon-garlic-asparagus-pasta-horizontal-161-1553190755.jpg"),HeroViewData.init(title: "Grab Some Sushi", cta: "Save 30%", backgroundColor: .red, image: "https://www.nippon.com/en/ncommon/contents/japan-data/169591/169591.jpg")]

    private let cellID = "cellId"
    static let categoryHeaderId = "categoryHeaderId"
    let headerID = "headerID"
    let heroCellID = "heroCellId"


    init() {
        super.init(collectionViewLayout: FoodController.createLayout())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = "Food Delivery"
        collectionView.register(HostingCollectionViewCell.self, forCellWithReuseIdentifier: heroCellID)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(Header.self, forSupplementaryViewOfKind: FoodController.categoryHeaderId, withReuseIdentifier: headerID)    }





    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
        return header
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return heroData.count
        case 1:
            return 8
        case 2:
            return 4
        case 3:
            return 5
        default:
            return 0
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIViewController()
        controller.view.backgroundColor = indexPath.section == 0 ? .yellow : .blue
        if indexPath.section == 0{
            controller.title = heroData[indexPath.row].title
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
            cell.backgroundColor = indexPath.row % 2 == 0 ? .white : .red
            return cell
        case 1:
            //categories custom object with name and image
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
            cell.backgroundColor = .magenta
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
            cell.backgroundColor = .blue
            return cell
        case 3:
            //
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
            cell.backgroundColor = .green
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
                section.contentInsets.top = 16
//                section.boundarySupplementaryItems = [
//                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderId, alignment: .topLeading)
//                ]
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

class Header: UICollectionReusableView{
    let label = UILabel()
    override init(frame: CGRect) {
        super.init(frame:frame)
        label.text =  "Categories"

        addSubview(label)
    }

    override func layoutSubviews() {
        label.frame = bounds
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

struct ContentView: View {
    var body: some View {
        Container().edgesIgnoringSafeArea(.all)
    }

    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) ->  UIViewController {
            return UINavigationController(rootViewController: FoodController())
        }

        func updateUIViewController(_ uiViewController:  UIViewController, context: Context) {

        }
        typealias UIViewControllerType = UIViewController

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }

    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) ->  UIViewController {
            return UINavigationController(rootViewController: FoodController())
        }

        func updateUIViewController(_ uiViewController:  UIViewController, context: Context) {

        }
        typealias UIViewControllerType = UIViewController

    }
}
