//
//  PoweredTouchBar.swift
//
//
//  Created by Pavel Kasila on 22.03.21.
//

import SwiftUI

public struct PoweredTouchBar<Content: View>: NSViewControllerRepresentable {
    var content: () -> Content
    var items: () -> [PoweredTouchBarItem]
    
    public init(content: @escaping () -> Content, @PoweredTouchBarBuilder items: @escaping () -> [PoweredTouchBarItem]) {
        self.content = content
        self.items = items
    }
    
    public func makeNSViewController(context: Context) -> TouchBarContainedViewController<Content> {
        let vc = TouchBarContainedViewController<Content>()
        vc.content = content
        vc.items = items()
        return vc
    }
    
    public func updateNSViewController(_ nsViewController: TouchBarContainedViewController<Content>, context: Context) {
        
    }
}
