//
//  SwiftUIView.swift
//  clonecoding_practice
//
//  Created by 하명관 on 2023/04/29.
//

import SwiftUI

import SwiftUI


struct Flashcard<Front, Back>: View where Front: View, Back: View {
    
    var front: () -> Front
    var back: () -> Back
    
    @State var flipped: Bool = false
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0
    
    
    var body: some View {
        ZStack {
            
            if flipped {
                back()
            } else {
                front()
            }
            
        }
        // 카드 뒷 이미지 바꾸기
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .frame(height: 463)
        .frame(maxWidth: .infinity)
        .onTapGesture {
            flipped ? flipBackFlashcard() : flipFlashcard()
        }
        .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0),perspective: 0.2)
    }
    
    func flipFlashcard() {
        let animationTime = 0.5
        withAnimation(Animation.linear(duration: animationTime)) {
            flashcardRotation -= 180
        }
        
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotation += 180
            flipped.toggle()
        }
    }
    
    func flipBackFlashcard() {
        let animationTime = 0.5
        withAnimation(Animation.linear(duration: animationTime)) {
            flashcardRotation += 180
        }
        
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotation += 180
            flipped.toggle()
        }
    }
}

struct CardFrontView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color("ChulsseugCardColor"))
            .frame(height: 463)
            .cornerRadius(24)
            .frame(maxWidth: .infinity)
            .overlay(
                VStack(spacing: 0){
                    
                    Image("ChulssegCharacter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 152)
                        .padding(.top,85)
                        .padding(.bottom,42)
                    
                    Text("오늘은 아카데미 휴일!")
                        .foregroundColor(Color("ChulsseugTextColor"))
                        .font(.system(size: 18))
                        .padding(.bottom,6)
                    
                    Text("푹 쉬고 다음에 만나요.")
                        .foregroundColor(Color("ChulsseugTextColor"))
                        .font(.system(size: 18))
                        .padding(.bottom,16)
                    
                    HStack(spacing: 1){
                        Text("출썩 규정 보러가기")
                            .foregroundColor(Color("ChulsseugTextColorPurple"))
                            .font(.system(size: 13))
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("ChulsseugPurpleColor"))
                            .font(.system(size: 10.2857))
                        
                    }.padding(.bottom,30)
                    
                }
            )
    }
}

struct CardBackView: View {
    var body: some View{
        Rectangle()
            .foregroundColor(Color("ChulsseugCardColor"))
            .frame(height: 463)
            .cornerRadius(24)
            .frame(maxWidth: .infinity)
            .overlay(
                VStack(alignment: .leading,spacing: 0){
                    
                    Text("한눈에 보는 출석 규정")
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.leading, 40)
                        .padding(.bottom, 35)
                    
                    Image("Calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal,90)
                    
                }
            )
    }
}

struct FlashCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChulsseugMainView()
    }
}
