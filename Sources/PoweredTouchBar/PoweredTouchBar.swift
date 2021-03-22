//
//  PoweredTouchBar.swift
//
//
//  Created by Pavel Kasila on 22.03.21.
//

import SwiftUI

public struct PoweredTouchBar<Content: View>: NSViewControllerRepresentable {
    var content: () -> Content
    
    public init(content: @escaping () -> Content) {
        self.content = content
    }
    
    public func makeNSViewController(context: Context) -> TouchBarContainedViewController<Content> {
        let vc = TouchBarContainedViewController<Content>()
        vc.content = content
        return vc
    }
    
    public func updateNSViewController(_ nsViewController: TouchBarContainedViewController<Content>, context: Context) {
        
    }
}
