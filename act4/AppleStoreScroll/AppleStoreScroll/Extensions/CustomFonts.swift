//
//  Fonts.swift
//  AppleStoreScroll
//
//  Created by 하명관 on 2023/07/03.
//

import Foundation
import SwiftUI

struct CustomLinearGradient: ViewModifier {
    
    var fontSize: Double
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: fontSize))
            .fontWeight(.bold)
            .foregroundStyle(
                LinearGradient(
                    colors: [Color("ColorFontPurple100"), Color("ColorFontPurple200")],
                    startPoint: .top,
                    endPoint: .bottom)
            )
    }
    
}
struct basicFontTitle: ViewModifier {
    var fontSize: Double
    
    func body(content:Content) -> some View {
        content
            .font(.system(size: fontSize))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

extension View{
    func customLinearGradient(fontSize: Double) -> some View{
        self.modifier(CustomLinearGradient(fontSize: fontSize))
    }
    func basicFont(fontSize: Double) -> some View {
        self.modifier(basicFontTitle(fontSize: fontSize))
    }
}
