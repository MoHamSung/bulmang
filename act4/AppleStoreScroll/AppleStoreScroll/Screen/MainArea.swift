//
//  MainArea.swift
//  AppleStoreScroll
//
//  Created by 하명관 on 2023/06/25.
//

import SwiftUI

enum SelectColor {
    case deepPurple
    case gold
    case silver
    case spaceBlack
}

struct MainArea: View {
    
    @State var selectColor:SelectColor = .deepPurple
    
    var body: some View {
        
        switch selectColor {
        case .deepPurple:
            ProductView(imageName: "ImgMain01", selectedColor: "딥 퍼플", selectColor: $selectColor, offsetCircle: -57)
        case .gold:
            ProductView(imageName: "ImgMain02", selectedColor: "골드", selectColor: $selectColor, offsetCircle: -19)
        case .silver:
            ProductView(imageName: "ImgMain03", selectedColor: "실버", selectColor: $selectColor, offsetCircle: 19)
        case .spaceBlack:
            ProductView(imageName: "ImgMain04", selectedColor: "스페이스 블랙", selectColor: $selectColor, offsetCircle: 57)
        }
    }
}

struct ProductView: View {
    
    var imageName: String
    var selectedColor: String
    @Binding var selectColor: SelectColor
    var offsetCircle: Double
    
    
    var body: some View{
        ZStack{
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .overlay{
                    VStack(spacing:0) {
                        
                        Text("iPhone 14 Pro")
                            .foregroundColor(Color("ColorFontWhite"))
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                            .padding(.top,70)
                        
                        
                        Text("프로 그 이상.")
                            .foregroundColor(Color("ColorFontWhite"))
                            .fontWeight(.black)
                            .font(.system(size: 40))
                            .padding(.top,6)
                        
                        Text(selectedColor)
                            .foregroundColor(Color("ColorFontDarkGray"))
                            .font(.system(size: 10))
                            .padding(.top,330)
                        
                        
                        
                        HStack(spacing: 15) {
                            
                            Circle()
                                .fill(Color("ColorBtnDeepPurple"))
                                .frame(width: 23, height: 23)
                                .onTapGesture {
                                    selectColor = .deepPurple
                                    print("purple")
                                }
                            
                            Circle()
                                .fill(Color("ColorBtnGold"))
                                .frame(width: 23, height: 23)
                                .onTapGesture {
                                    selectColor = .gold
                                    print("gold")
                                }
                            Circle()
                                .fill(Color("ColorBtnSilver"))
                                .frame(width: 23, height: 23)
                                .onTapGesture {
                                    selectColor = .silver
                                    print("silver")
                                }
                            Circle()
                                .fill(Color("ColorBtnBlack"))
                                .frame(width: 23, height: 23)
                                .onTapGesture {
                                    selectColor = .spaceBlack
                                    print("spaceBlack")
                                }
                            
                        }
                        .overlay{
                            withAnimation(.linear){
                                Circle()
                                    .stroke(lineWidth: 1)
                                    .offset(x:offsetCircle)
                                    .frame(width: 31, height: 31)
                                    .foregroundColor(Color("ColorBtnBlue"))
                            }
                        }
                        .padding(.top,10)
                        
                        Spacer()
                    }
                }
            
            
        }
    }
}

struct MainArea_Previews: PreviewProvider {
    static var previews: some View {
        MainArea()
    }
}
