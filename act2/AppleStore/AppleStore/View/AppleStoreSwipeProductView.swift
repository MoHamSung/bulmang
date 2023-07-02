//
//  AppleStoreSwipeProductView.swift
//  AppleStore
//
//  Created by 하명관 on 2023/05/21.
//

import SwiftUI

struct AppleStoreSwipeProductView: View {
    
    @State var currentIndex: Int = 0
    var products: [SwipeModel] = []
    
    // Product Card 옆 공백
    var spacing: CGFloat = 20
    // 전체 넓이에서 Card넓이를 뺀 값
    var trailingSpace: CGFloat = 60
    // Gesture값들을 감지하고 업데이트 시켜줌
    @GestureState var offset: CGFloat = 0
    
    let swipes : [SwipeModel] = [
        .init(title: "다채롭게 만개한\n어버이날 선물", subTitle: "쉽게 선물 쇼핑하기", imageName: "ImgSwipeProduct01",textColor: Color("ColorFontBlack"),subTextColor: Color("ColorFontBlack")),
        .init(title: "iPhone 14 Pro\n딥 퍼플", subTitle: "몽환적인 색감, 색다른 경험.", imageName: "ImgSwipeProduct02",textColor: Color("ColorFontWhite"),subTextColor: Color("ColorFontGray")),
        .init(title: "MacBook Pro 14\n및 16", subTitle: "이거 문구를 발견하고, 톡방에 메세지를\n먼저 보내는 사람은 페페의 선물이!", imageName: "ImgSwipeProduct03",textColor: Color("ColorFontWhite"),subTextColor: Color("ColorFontGray")),
    ]
    
    var body: some View {
        
        VStack(spacing: 0){
            
            Text("추천")
                .font(.system(size:24))
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top,38)
                .padding(.bottom,38)
                .padding(.leading,20)
            
            
            GeometryReader { geo in
                // 전체넓이에서 공백 넓이만 뺀 값
                let width = geo.size.width - (trailingSpace - spacing)
                // 두번째 카드 일 때 양 옆 카드의 끝을 똑같이 보여주는 넓이 값
                let adjustMentWidth = (trailingSpace / 2) - spacing
                let size = geo.size
                
                HStack(spacing: spacing){
                    ForEach(swipes) { product in
                        Image(product.imageName)
                            .resizable()
                            .scaledToFit()
                            .shadow(radius: 5,x:1,y:1)
                            .overlay{
                                VStack(alignment:.leading,spacing: 0){
                                    
                                    Text(product.title)
                                        .font(.system(size: 26))
                                        .foregroundColor(product.textColor)
                                        .fontWeight(.heavy)
                                        .padding(.top,38)
                                    
                                    Text(product.subTitle)
                                        .padding(.top,8)
                                        .foregroundColor(product.textColor)
                                    
                                    Spacer()
                                }
                                .padding(.leading,20)
                                .frame(maxWidth: .infinity,alignment: .leading)
                            }
                            .frame(width: geo.size.width - trailingSpace)
                        
                        
                    }
                    
                    let _ = print("secondWidth = \(geo.size.width)")
                }
                
                .padding(.horizontal,20)
                // 이거 디버그 하는 방법 물어보기
                // 가로 위치 조정 -는 카드가 좌측으로 이동 , offset을 드레그 제스처로 값을 게속 업데이트 시켜서 x위치를 실시간 업데이트
                .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0) + offset)
                .gesture(
                    DragGesture()
                        .updating($offset, body: { value, out, _ in
                            // out이 width값
                            out = value.translation.width
                            print("out = \(out)")
                        })
                        .onEnded({ value in
                            // value는 시작 위치와 끝나는 위치 표시,움직이는 속도도 표시
                            // translation은 width값과 hegiht값으로 볗놘
                            let offsetX = value.translation.width
                            print("value = \(value)")
                            print("value.translation = \(value.translation)")
                            print("value.translation.widthf = \(value.translation.width)")
                            
                            // ofsset이 화면의 반을 넘기면 Swipe(좌측으로 넘기면 - 우측은 +)
                            let progress = -offsetX / width
                            
                            // 0.5를 넘기면 반올림
                            let roundIndex = progress.rounded()
                            
                            // 배열 에러 방지
                            currentIndex = max(min(currentIndex + Int(roundIndex), swipes.count - 1), 0)
                            
                            
                        })
                )
            }
            .frame(height: 509)
            .animation(.easeInOut, value: offset == 0)
        }
    }
}

struct AppleStoreSwipeProductView_Previews: PreviewProvider {
    static var previews: some View {
        AppleStoreSwipeProductView()
    }
}
