//
//  ContentView.swift
//  AppleStoreScroll
//
//  Created by 하명관 on 2023/06/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var isButtonActive: Bool = true
    @State var wholeViewHeight: CGFloat = 0.0
    @State var currentHeight: CGFloat = 0.0
    @State var productHeight: CGFloat = 0.0
    @State var purchaseHeight: CGFloat = 0.0
    @State var footerHeight: CGFloat = 0.0
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView(){
                VStack(spacing: 20) {
                    
                    MainArea()
                    
                    VStack(spacing: 20) {
                        
                        ContentArea()
                        
                        productArea()
                            .background{
                                GeometryReader { GeometryProxy in
                                    Color.clear
                                        .onAppear{
                                            print("Product 높이:  \(GeometryProxy.size.height)")
                                            productHeight = GeometryProxy.size.height
                                        }
                                }
                            }
                        
                        purchaseView()
                            .background{
                                GeometryReader { GeometryProxy in
                                    Color.clear
                                        .onAppear{
                                            print("PurchaseView 높이 : \(GeometryProxy.size.height)")
                                            purchaseHeight = GeometryProxy.size.height
                                        }
                                }
                            }
                        
                        FooterView()
                            .background{
                                GeometryReader { GeometryProxy in
                                    Color.clear
                                        .onAppear{
                                            print("FooterView 높이 : \(GeometryProxy.size.height)")
                                            footerHeight = GeometryProxy.size.height
                                        }
                                }
                            }
                            
                    }
                    .background(
                        Color("ColorBgGray")
                    )
                }
                .overlay{
                    GeometryReader { GeometryProxy in
                        Color.clear
                            .preference(
                                key: OffsetPreferenceKey.self,
                                value: GeometryProxy.frame(in: .named("scroll")).origin.y
                            )
                            .onAppear{
                                print("스크롤 전체 높이:  \(GeometryProxy.size.height)")
                                wholeViewHeight = GeometryProxy.size.height
                            }
                    }
                }
                .background(
                    Color("ColorBgBlack")
                        .ignoresSafeArea()
                )
            }
            .coordinateSpace(name: "scroll")
            // Modifier 위치 정보의 변경 사항을 감지하고, 변경 사항이 발생할 때마다 특정 동작을 수행하는 클로저를 실행
            .onPreferenceChange(OffsetPreferenceKey.self) { value in
                currentHeight = value
                print("currentHeight: \(value)")
                
                // 현재 디바이스 기기의 높이를 측정하여 내가 원하는 지점에서 Bool값을 바꿔줌
                if -(currentHeight - UIScreen.main.bounds.height) < (wholeViewHeight - purchaseHeight - footerHeight){
                    withAnimation(.spring(response:0.5,dampingFraction:0.5,blendDuration: 0.5)){
                        isButtonActive = true
                    }
                } else {
                    withAnimation(.spring(response:0.5,dampingFraction:0.5,blendDuration: 0.5)){
                        isButtonActive = false
                    }
                }
                print (-(currentHeight - UIScreen.main.bounds.height))
                print (wholeViewHeight - productHeight)
            }
            .overlay(alignment:.bottom){
                withAnimation(.interactiveSpring(response: 0.8,dampingFraction: 0.6,blendDuration: 0.6)) {
                    purchaseButton()
                }
                
            }
            .ignoresSafeArea()
        }
    }
    // MARK: Simple View
    @ViewBuilder
    func purchaseButton() -> some View {
        HStack{
            
            Text("₩1,250,000부터")
                .font(.system(size: 10))
                .foregroundColor(Color("ColorFontBlack"))
            
            Spacer()
            
            Button {
                
            } label: {
                Text("구입하기")
                    .font(.system(size: 13))
                    .foregroundColor(Color("ColorBtnBlue"))
            }
            .padding(.vertical, 20)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .padding(.horizontal, 20)
        .offset(y: isButtonActive ? -70 : 500)
//        .offset(y: -70)
    }
    
    @ViewBuilder
    func productArea() -> some View{
        VStack(spacing: 10) {
            
            Text("iPhone 14 Pro 더 깊이 살펴보기")
                .fontWeight(.bold)
                .font(.system(size: 24))
                .foregroundColor(.black)
                .padding(.top,60)
            
            Button {
                
            } label: {
                Text("apple.com에서 더 알아보기")
            }
            .padding(.bottom,60)

        }
        .frame(maxWidth: .infinity)
        .background(Color("ColorBgWhite"))
    }
    
    @ViewBuilder
    func purchaseView() -> some View{
        VStack(spacing: 20) {
            Image("ImgProduct01")
                .resizable()
                .scaledToFit()
                .overlay(alignment: .top){
                    VStack {
                        Button {
                            
                        } label: {
                            Text("구입하기")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(.vertical,5)
                                .padding(.horizontal,14)
                                .background(
                                    Color("ColorBtnBlue")
                                )
                                .cornerRadius(15)
                        }
                        
                        Text("₩ 1,550,000부터")
                            .foregroundColor(.black)
                            .font(.system(size: 10))
                        
                    }
                    .offset(y: 441)

                }
        }
        .foregroundColor(Color("ColorBgWhite"))
    }
}
// 레이아웃 시스템의 뷰의 위치 데이터를 수집
struct OffsetPreferenceKey: PreferenceKey {
    // 화면위치의 초기값
    static var defaultValue: CGFloat = 0
    
    //inout 매개변수를 통해 값을 변경해야함, nextValue를 호출하여 새로운값을 가져와서 업데이트
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

