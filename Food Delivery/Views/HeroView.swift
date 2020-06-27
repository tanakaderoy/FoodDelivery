//
//  HeroView.swift
//  Food Delivery
//
//  Created by Tanaka Mazivanhanga on 6/25/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import SwiftUI

struct HeroView: View {
    @Environment(\.imageCache) var cache: ImageCache

    var data: HeroViewData
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Spacer()
                Text(data.title.uppercased()).font(.largeTitle).foregroundColor(Color.white).multilineTextAlignment(.leading)
                Text(data.cta.uppercased()).font(.title).foregroundColor(Color.white).multilineTextAlignment(.leading)
                Spacer()
            }.padding(.leading, 16)
            Spacer()
            ZStack(alignment:.trailing){
                AsyncImage(url: URL(string: data.image)!, placeholder: Text("Loading"), cache: cache, width: 200, height: 200).aspectRatio(contentMode: .fill)
                Rectangle() .foregroundColor(.clear)        // Making rectangle transparent
                    .background(LinearGradient(gradient: Gradient(colors: [data.backgroundColor,.clear]), startPoint: .leading, endPoint: .trailing))

            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
        }.background(data.backgroundColor)
    }
}


struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(data: HeroViewData.init(title: "Grab Some Sushi", cta: "Save 30%", backgroundColor: .red, image: "https://www.demandafrica.com/wp-content/uploads/2018/06/Nigerian-jollof.jpeg"))
    }
}
