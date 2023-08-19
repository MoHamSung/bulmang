//
//  Modifier.swift
//  KakaoBank
//
//  Created by 하명관 on 2023/08/15.
//

import SwiftUI

struct SpringAnimation: ViewModifier {
    let dealy: Double
    
    init(dealy: Double) {
        self.dealy = dealy
    }
    
    func body(content: Content) -> some View {
        content
            .animation(.default.delay(dealy))
            .transition(.move(edge: .bottom))
    }
}
