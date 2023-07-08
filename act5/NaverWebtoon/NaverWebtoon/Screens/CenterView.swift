//
//  CenterView.swift
//  NaverWebtoon
//
//  Created by 하명관 on 2023/07/08.
//

import SwiftUI

struct CenterView: View {
    //MARK: Properties
    @State private var currentTab: TabModel = tab[0]
    @State private var tabs: [TabModel] = tab
    @State private var contentOffset: CGFloat = 0
    @State private var indicatorWidth: CGFloat = 0
    @State private var indicatorPosition: CGFloat = 0
    
    var animation:Namespace.ID
    
    var body: some View {
        // selection 매개변수와 상태 속성인 currentTab 사이의 동기화를 위해 SwiftUI가 View의 내부 상태 변화를 추적해야 하기 때문
        TabView(selection: $currentTab){
            ForEach(tabs) { tab in
                GeometryReader {
                    let size = $0.size
                    
                    Image(tab.tabName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: size.width, height: size.height)
                }
                .clipped()
                .ignoresSafeArea()
                .offsetX { rect in
                    if currentTab.tabName == tab.tabName{
                        contentOffset = rect.minX - (rect.width * CGFloat(index(of: tab)))
                    }
                    updateTabFrame(rect.width)
                }
                .tag(tab)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .overlay(alignment:.top, content: {
            HStack(spacing: 0){
                ForEach($tabs) { $tab in
                    Button {
                        currentTab.tabName = tab.tabName
                    } label: {
                        Text(tab.tabName)
                            .foregroundColor(currentTab.tabName == tab.tabName ? Color("FontGreen") : Color.black )
                            .fontWeight(.semibold)
                            // 계산 목적으로 탭의 minx 및 너비 저장
                            .offsetX { rect in
                                tab.minX = rect.minX
                                tab.width = rect.width
                            }
//                            .overlay(
//                                // Adding Matched Geometry Effect...
//                                ZStack{
//                                    if currentTab.tabName == tab.tabName{
//                                        Capsule()
//                                            .fill(Color("FontGreen"))
//                                            .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
//                                            .frame(width: indicatorWidth,height: 4)
//                                            .offset(y:10)
//                                    }
//                                    else{
//                                        Capsule()
//                                            .fill(Color.clear)
//                                            .frame(width: indicatorWidth,height: 4)
//                                            .offset(y:10)
//                                    }
//                                }
//                                .padding(.horizontal,-5)
//
//                                ,alignment: .bottom
//                            )
                    }
                    if tabs.last != tab {
                        Spacer(minLength: 0)
                    }
                }
                
            }
            .padding([.top,.horizontal] , 15)
            .overlay(alignment: .bottomLeading) {
                    Rectangle()
                        .frame(width: indicatorWidth, height: 4)
                        .foregroundColor(Color("FontGreen"))
                        .offset(x: indicatorPosition, y: 10)
            }
        })
    }
    // 탭 넓이와 위치 계산
    func updateTabFrame(_ tabViewWidth: CGFloat) {
        let inputRange = tabs.indices.compactMap { index -> CGFloat? in
            return CGFloat(index) * tabViewWidth
        }
        
        let outputRangeForeWidth = tabs.compactMap { tab -> CGFloat? in
            return tab.width
        }
        
        let outputRangeForPosition = tabs.compactMap { tab -> CGFloat? in
            return tab.minX
        }
        
        let widthInterpolation = LinearInterpolation(inputRange: inputRange, outputRange: outputRangeForeWidth)
        
        let positionInterpolation = LinearInterpolation(inputRange: inputRange, outputRange: outputRangeForPosition)
        
        indicatorWidth = widthInterpolation.calculate(for: -contentOffset)
        indicatorPosition = positionInterpolation.calculate(for: -contentOffset)
    }
    
    func index(of tab: TabModel) -> Int {
        return tabs.firstIndex(of: tab) ?? 0
    }
    
    @ViewBuilder
    func TabsView() -> some View{
        HStack(spacing: 0){
            ForEach($tabs) { $tab in
                Text(tab.tabName)
                    .fontWeight(.semibold)
                    // 계산 목적으로 탭의 minx 및 너비 저장
                    .offsetX { rect in
                        tab.minX = rect.minX
                        tab.width = rect.width
                    }
            
                if tabs.last != tab {
                    Spacer(minLength: 0)
                }
            }
        }
        .padding([.top,.horizontal] , 15)
        .overlay(alignment: .bottomLeading, content: {
            Rectangle()
                .frame(width: indicatorWidth,height: 4)
                .offset(x: indicatorPosition,y:10)
        })
    }
}

//struct CenterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CenterView()
//    }
//}
