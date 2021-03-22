//
//  PoweredTouchBarModifier.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import SwiftUI

struct PoweredTouchBarModifier: ViewModifier {
    var items: () -> [PoweredTouchBarItem]
    
    init(items: @escaping () -> [PoweredTouchBarItem]) {
        self.items = items
    }
    
    func body(content: Content) -> some View {
        PoweredTouchBar(content: {content}, items: items)
    }
}

extension View {
    public func poweredTouchBar(@PoweredTouchBarBuilder items: @escaping () -> [PoweredTouchBarItem]) -> some View {
        self.modifier(PoweredTouchBarModifier(items: items))
    }
}
