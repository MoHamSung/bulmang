//
//  ContentView.swift
//  KakaoBank
//
//  Created by 하명관 on 2023/08/13.
//

import SwiftUI

struct ContentView: View {
    @State var isMainViewAppear = false
    
    @ObservedObject var viewModel = AppViewModel()
    
    var body: some View {
        MainView(isMainViewAppear: $isMainViewAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
