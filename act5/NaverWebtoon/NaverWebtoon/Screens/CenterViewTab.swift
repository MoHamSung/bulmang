//
//  CenterView.swift
//  NaverWebtoon
//
//  Created by 하명관 on 2023/07/08.
//

import SwiftUI

struct CenterViewTab: View {
    //MARK: Properties
    @State private var currentTab: TabModel = tab[0]
    @State private var tabs: [TabModel] = tab
    @State private var contentOffset: CGFloat = 0
    @State private var indicatorWidth: CGFloat = 0
    @State private var indicatorPosition: CGFloat = 0
    let deviceHeight = UIScreen.main.bounds.height
    let deviceWidth = UIScreen.main.bounds.width
    
    var body: some View {
        // selection 매개변수와 상태 속성인 currentTab 사이의 동기화를 위해 SwiftUI가 View의 내부 상태 변화를 추적해야 하기 때문
        
            VStack {
                TabView(selection: $currentTab){
                    ForEach(tabs) { tab in
                        GeometryReader { geometry in
                            getView(for: tab)
                                .frame(width: deviceWidth)
                        }
                        .clipped()
                        .ignoresSafeArea()
                        .offsetX { rect in
                            if currentTab.tabName == tab.tabName {
                                contentOffset = rect.minX - (rect.width * CGFloat(index(of: tab)))
                            }
                            updateTabFrame(rect.width)
                        }
                        .tag(tab)
                    }
                }
                .padding(.top, 50)
                .frame(height: 700)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .overlay(alignment: .top, content: {
                    TabsView()
                })
                
                
            }
        
    }
    
    func getView(for tab: TabModel) -> some View {
        switch tab.viewName {
        case "MondayView":
            return AnyView(MondayView())
        case "TuesdayView":
            return AnyView(TuesdayView())
        case "WednesdayView":
            return AnyView(WednesdayView())
        case "ThursdayView":
            return AnyView(ThursdayView())
        case "FridayView":
            return AnyView(FridayView())
        case "SaturdayView":
            return AnyView(SaturdayView())
        case "SundayView":
            return AnyView(SundayView())
        case "NewdayView":
            return AnyView(NewdayView())
        default:
            return AnyView(EmptyView())
        }
    }
    
    // 나머지 코드 생략


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
                    .foregroundColor(currentTab.tabName == tab.tabName ?  Color("FontGreen"): Color.black)
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
                .foregroundColor(Color("FontGreen"))
                .frame(width: indicatorWidth,height: 4)
                .offset(x: indicatorPosition,y:10)
            })
        }
    
}
struct CenterViewTab_Previews: PreviewProvider {
    static var previews: some View {
        CenterViewTab()
    }
}

