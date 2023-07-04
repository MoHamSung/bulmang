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
                        
                        ProductArea()
                            .background{
                                GeometryReader { GeometryProxy in
                                    Color.clear
                                        .onAppear{
                                            print("Product 높이:  \(GeometryProxy.size.height)")
                                            productHeight = GeometryProxy.size.height
                                        }
                                }
                            }
                        
                        PurchaseView()
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
            .onPreferenceChange(OffsetPreferenceKey.self) { value in
                currentHeight = value
                print("currentHeight: \(value)")
                
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
                withAnimation(.interactiveSpring(response: 0.5,dampingFraction: 0.6,blendDuration: 0.6)) {
                    purchaseButton()
                }
                
            }
            .ignoresSafeArea()
        }
    }
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
}

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

