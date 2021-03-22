//
//  TouchBarPoweredViewController.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import AppKit
import SwiftUI

public class TouchBarPoweredViewController<Content: View>: NSViewController, NSTouchBarDelegate {
    var content: (() -> Content)!
    var items: [PoweredTouchBarItem]!
    
    public override func loadView() {
        self.view = NSHostingView(rootView: content().focusable())
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        
        touchBar.customizationIdentifier =  NSTouchBar.CustomizationIdentifier("PoweredTouchBarTesting")
        let ids = items.map {$0.getIdentifier()}
        touchBar.defaultItemIdentifiers = ids + [.otherItemsProxy]
        touchBar.customizationAllowedItemIdentifiers = ids
        
        return touchBar
    }
    
    public func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        if let item = items.first(where: { (item) -> Bool in
            return item.getIdentifier() == identifier
        }) {
            return item.touchBarItem()
        } else {
            return nil
        }
    }
}
