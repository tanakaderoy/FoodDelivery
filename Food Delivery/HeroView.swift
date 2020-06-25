//
//  HeroView.swift
//  Food Delivery
//
//  Created by Tanaka Mazivanhanga on 6/25/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import SwiftUI

struct HeroView: View {
    var data: HeroViewData
    var body: some View {
        HStack{
            VStack {
                Spacer()
                Text(data.title.uppercased()).font(.largeTitle).foregroundColor(Color.white).multilineTextAlignment(.leading)
                Text(data.cta.uppercased()).font(.title).foregroundColor(Color.white).multilineTextAlignment(.leading)
                Spacer()
            }.padding(.leading, 16)
            VStack{
                Spacer()
                Image(systemName: "play").scaledToFill()
                    .frame(width: 100.0, height: 100.0)
                Spacer()
            }
            Spacer()
        }.background(data.backgroundColor)
    }
}


class HostingCollectionViewCell: UICollectionViewCell {
    func host<Content: View>(_ hostingController: UIHostingController<Content>) {
        backgroundColor = .clear
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.backgroundColor = .clear

        addSubview(hostingController.view)

        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            hostingController.view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            hostingController.view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

struct HeroViewData {
    var title: String
    var cta: String
    var backgroundColor: Color
    var image: String?
}


struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(data: HeroViewData.init(title: "Grab Some Sushi", cta: "Save 30%", backgroundColor: .red, image: nil))
    }
}
