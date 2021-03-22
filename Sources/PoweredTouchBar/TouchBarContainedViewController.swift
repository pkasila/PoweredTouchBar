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
        self.view = NSHostingView(rootView: content())
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delay making the view the first responder to avoid SwiftUI errors.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.view.becomeFirstResponder()
        }
    }
    
    public override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        
        touchBar.customizationIdentifier =  NSTouchBar.CustomizationIdentifier("My First TouchBar")
        touchBar.defaultItemIdentifiers = [NSTouchBarItem.Identifier("HelloWorld")]
        touchBar.customizationAllowedItemIdentifiers = [NSTouchBarItem.Identifier("HelloWorld")]
        
        return touchBar
    }
    
    public func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
            switch identifier {
            case NSTouchBarItem.Identifier("HelloWorld"):
                let customViewItem = NSCustomTouchBarItem(identifier: identifier)
                customViewItem.view = NSTextField(labelWithString: "Hello World!")
                return customViewItem
            default:
                return nil
            }
    }
}
