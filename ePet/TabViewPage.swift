//
//  TabViewPage.swift
//  ePet
//
//  Created by Daniel on 30/7/2025.
//

import SwiftUI

struct TabViewPage: View {
    var body: some View {
        
        TabView {
            HomePage().tabItem {
                Image(systemName: "pawprint.fill")
                Text("我的寵物") }.tag(1)
            
            MakeMoney().tabItem {
                Image(systemName: "dollarsign")
                Text("賺錢") }.tag(2)
            ShopView().tabItem {
                Image(systemName: "cart")
                Text("商店") }.tag(3)
        }
    }
}

#Preview {
    TabViewPage()
}
