//
//  MainView.swift
//  AppleStoreScroll
//
//  Created by 하명관 on 2023/06/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        ZStack{
            Color("ColorFontDarkGray")
                .ignoresSafeArea()
            ScrollView {
                MainArea()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
