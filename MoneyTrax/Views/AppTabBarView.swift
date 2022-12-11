//
//  AppTabBarView.swift
//  MoneyTrax
//
//  Created by Joseph  DeWeese on 12/11/22.
//

import SwiftUI

struct AppTabBarView: View {
    //MARK: PROPERTIES
    @State private var selection:  String = "Home"
    
    
    var body: some View {
        TabView(selection: $selection, content: {
            Color.red
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "pencil.circle")
                    Text("Categories")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.pink
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Reports")
                }
            Color.yellow
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Goals")
                }
        })
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
    }
}
