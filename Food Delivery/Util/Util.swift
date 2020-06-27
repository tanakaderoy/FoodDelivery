//
//  Util.swift
//  Food Delivery
//
//  Created by Tanaka Mazivanhanga on 6/25/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import Foundation
import UIKit
enum imageNames: String{
    case burger,cake,egg,fish,noodle,pineapple,pizza,riceBowl,spaghetti,sushi,taco,vegan
}
 let heroData = [HeroViewData.init(title: "Grab Some Jollof", cta: "Save 30%", backgroundColor: .black, image: "https://www.demandafrica.com/wp-content/uploads/2018/06/Nigerian-jollof.jpeg"),HeroViewData.init(title: "Grab Some Burgers", cta: "Save 30%", backgroundColor: .purple, image: "https://timeincsecure-a.akamaihd.net/rtmp_uds/429048911/202004/2769/429048911_6152425885001_6152427053001-vs.jpg?pubId=429048911&videoId=6152427053001"),HeroViewData.init(title: "Grab Some Pasta", cta: "Save 30%", backgroundColor: .yellow, image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190305-lemon-garlic-asparagus-pasta-horizontal-161-1553190755.jpg"),HeroViewData.init(title: "Grab Some Sushi", cta: "Save 30%", backgroundColor: .red, image: "https://www.nippon.com/en/ncommon/contents/japan-data/169591/169591.jpg"),HeroViewData.init(title: "Grab Some Jollof", cta: "Save 30%", backgroundColor: .black, image: "https://www.demandafrica.com/wp-content/uploads/2018/06/Nigerian-jollof.jpeg"),HeroViewData.init(title: "Grab Some Burgers", cta: "Save 30%", backgroundColor: .purple, image: "https://timeincsecure-a.akamaihd.net/rtmp_uds/429048911/202004/2769/429048911_6152425885001_6152427053001-vs.jpg?pubId=429048911&videoId=6152427053001"),HeroViewData.init(title: "Grab Some Pasta", cta: "Save 30%", backgroundColor: .yellow, image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/190305-lemon-garlic-asparagus-pasta-horizontal-161-1553190755.jpg"),HeroViewData.init(title: "Grab Some Sushi", cta: "Save 30%", backgroundColor: .red, image: "https://www.nippon.com/en/ncommon/contents/japan-data/169591/169591.jpg")]
let categoryData = [CategoryData.init(name: "Chinese", image: .noodle),CategoryData.init(name: "Pasta", image: .spaghetti),CategoryData.init(name: "BBQ", image: .burger),CategoryData.init(name: "Bakery", image: .cake),CategoryData.init(name: "Italian", image: .pizza), CategoryData.init(name: "Seafood", image: .fish),CategoryData.init(name: "Sushi", image: .sushi),CategoryData.init(name: "Vegan", image: .vegan)]

let messageData = [ MessageData.init(title: "Welcome", message: "Welcome to Food Delivery a DoorDash type App 😂", image: .riceBowl),MessageData.init(title: "Safe No-Contact Delivery", message: "Keep yourself safe with social distancing", image: .spaghetti), MessageData.init(title: "25% Off First Order", message: "Use code TANAKAFLOCKA at checkout for 25% off your first order*", image: .burger), MessageData.init(title: "Safe No-Contact Delivery", message: "Keep yourself safe with social distancing", image: .spaghetti)]

let itemData = [ItemData.init(image: .burger, itemName: "Tasty Hamburger Extra Large", subTitlem: "Fries and Drink included", price: "$9.99", hotOrNot: "HOT"),ItemData.init(image: .noodle, itemName: "Tasty Ramen Extra Large", subTitlem: "Fries and Drink included", price: "$13.99", hotOrNot: "HOT"),ItemData.init(image: .pizza, itemName: "Pepperoni Pizza Large", subTitlem: "Fries and Drink included", price: "$19.99", hotOrNot: "HOT"),ItemData.init(image: .sushi, itemName: "Sushi", subTitlem: "Fries and Drink included", price: "$9.99", hotOrNot: "HOT"),ItemData.init(image: .spaghetti, itemName: "Chicken Fettucini Alfredo", subTitlem: "Fries and Drink included", price: "$12.99", hotOrNot: "HOT"),ItemData.init(image: .cake, itemName: "Tasty Hamburger Extra Large", subTitlem: "Fries and Drink included", price: "$9.99", hotOrNot: "HOT"),ItemData.init(image: .taco, itemName: "Tasty Hamburger Extra Large", subTitlem: "Fries and Drink included", price: "$9.99", hotOrNot: "HOT"),ItemData.init(image: .pineapple, itemName: "Tasty Hamburger Extra Large", subTitlem: "Fries and Drink included", price: "$9.99", hotOrNot: "HOT")]


extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
