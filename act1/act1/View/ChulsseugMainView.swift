//
//  ChulsseugView.swift
//  CloneCoding
//
//  Created by 하명관 on 2023/04/27.
//

import SwiftUI

struct ChulsseugMainView: View {
    
    @State private var flip: Bool = false
    @State var flipped = false
    @State var buttonText: String = "출쓱하기"
    @State var name: String = "Bulmang"
    
    var body: some View {
        
        ZStack {
            
            Color("ChulsseugBackGroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0){
                
                
                HeaderView()
                
                
                customText()
                
                Flashcard(front: {CardFrontView()}, back: {CardBackView()})
                    .padding(.bottom,30)

                ButtonView(buttonText: $buttonText)
                
            }
            
            .padding(.horizontal,25)
        }
    }
    
    @ViewBuilder
    func customText() -> some View{
            
            Group {
                Text("월클 디벨로퍼 \(name).")
                    .padding(.bottom,8)
                    .padding(.top,30)
                Text("오늘도 화이팅하세요!")
                    .padding(.bottom,38)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .font(.system(size: 18))
        
    }
}

struct ChulsseugMainView_Previews: PreviewProvider {
    static var previews: some View {
        ChulsseugMainView()
    }
}
