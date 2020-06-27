//
//  MessageView.swift
//  Food Delivery
//
//  Created by Tanaka Mazivanhanga on 6/26/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import SwiftUI

struct MessageView: View {
    var data: MessageData
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                Text(data.title).font(.system(size: 16)).fontWeight(.heavy).padding(.bottom, 10).fixedSize(horizontal: false, vertical: true)
                Text(data.message).font(.system(size: 12)).lineLimit(2).fixedSize(horizontal: false, vertical: true)
                Spacer()
                Text("Learn More").foregroundColor(.red).padding(.bottom)
            }.padding(.horizontal, 16)
            Spacer()
            Image(uiImage: UIImage(named: data.image.rawValue)!).padding(.leading, 10.0)
        }.background(Color(UIColor(hexString: "#F4CC86"))).cornerRadius(10)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(data: MessageData.init(title: "Safe No-Contact Delivery", message: "Keep yourself safe with social distancing", image: .spaghetti))
    }
}
