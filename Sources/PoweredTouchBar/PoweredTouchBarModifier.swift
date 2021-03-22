//
//  PoweredTouchBarModifier.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import SwiftUI

struct PoweredTouchBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        PoweredTouchBar {
            content
        }
    }
}

extension View {
    func poweredTouchBar() -> some View {
        self.modifier(PoweredTouchBarModifier())
    }
}
