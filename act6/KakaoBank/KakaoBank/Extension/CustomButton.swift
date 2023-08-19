//
//  CustomButton.swift
//  KakaoBank
//
//  Created by 하명관 on 2023/08/13.
//

import Foundation
import SwiftUI

struct CustomButton: ViewModifier {
    let horizontal: CGFloat
    let vertical: CGFloat
    let opacity: Double
    let cornerRadius: CGFloat
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(.kakaoCapsuleSemiBold)
            .padding(.horizontal, horizontal)
            .padding(.vertical, vertical)
            .background(color.opacity(opacity))
            .cornerRadius(cornerRadius)
    }
}
