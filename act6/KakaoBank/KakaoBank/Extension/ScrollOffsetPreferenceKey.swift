//
//  ScrollOffsetPreferenceKey.swift
//  KakaoBank
//
//  Created by 하명관 on 2023/08/16.
//

import Foundation
import SwiftUI

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
