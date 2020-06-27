//
//  CategoryView.swift
//  Food Delivery
//
//  Created by Tanaka Mazivanhanga on 6/25/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    var data: CategoryData
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: data.image.rawValue)!)
            Text(data.name).fontWeight(.semibold)
        }.background(Color.clear)
    }
}


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(data: CategoryData.init(name: "Italian", image: .pizza))
    }
}
