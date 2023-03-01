//
//  ScrollViewOffsetPreferenceKey.swift
//  Airalo
//
//  Created by Alex Sarkisov on 01.03.23.
//

import SwiftUI

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

struct OffsetReader: View {
    
    static let coordinateSpace = "frameLayer"
    
    var body: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(key: OffsetPreferenceKey.self,
                            value: proxy.frame(in: .named(OffsetReader.coordinateSpace)).minY)
        }
        .frame(height: 0)
    }
}


