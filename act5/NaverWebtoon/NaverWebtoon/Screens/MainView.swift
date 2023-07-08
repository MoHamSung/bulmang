//
//  MainView.swift
//  NaverWebtoon
//
//  Created by 하명관 on 2023/07/07.
//

import SwiftUI

struct MainView: View {
    //MARK: PROPERTIES
    @Namespace var animation
    
    var body: some View {

        VStack {
            //MARK: HEADER
            HeaderView()
            
            //MARK: CENTER
            CenterView(animation: animation)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

