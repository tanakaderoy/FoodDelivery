//
//  ContentView.swift
//  Food Delivery
//
//  Created by Tanaka Mazivanhanga on 6/24/20.
//  Copyright © 2020 Tanaka Mazivanhanga. All rights reserved.
//

import SwiftUI

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
