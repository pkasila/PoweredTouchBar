//
//  TouchBarContainedViewController.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import AppKit
import SwiftUI

public class TouchBarContainedViewController<Content: View>: NSViewController, NSTouchBarDelegate {
    var content: (() -> Content)!
    
    public override func loadView() {
        self.view = NSHostingView(rootView: content().focusable())
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        
        touchBar.customizationIdentifier =  NSTouchBar.CustomizationIdentifier("My First TouchBar")
        touchBar.defaultItemIdentifiers = [NSTouchBarItem.Identifier("HelloWorld")]
        touchBar.customizationAllowedItemIdentifiers = [NSTouchBarItem.Identifier("HelloWorld")]
        touchBar.customizationRequiredItemIdentifiers = [NSTouchBarItem.Identifier("HelloWorld")]
        
        return touchBar
    }
    
    public func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
            switch identifier {
            case NSTouchBarItem.Identifier("HelloWorld"):
                let item = NSCustomTouchBarItem(identifier: identifier)
                item.view = NSButton(title: "Test button", target: nil, action: nil)
                return item
            default:
                return nil
            }
    }
}
