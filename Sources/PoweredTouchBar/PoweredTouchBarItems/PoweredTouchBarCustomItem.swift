//
//  PoweredTouchBarCustomItem.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import AppKit

public struct PoweredTouchBarCustomItem: PoweredTouchBarItem {
    
    var identifier: String
    var view: NSView
    
    public init(identifier: String, view: NSView) {
        self.identifier = identifier
        self.view = view
    }
    
    public func touchBarItem() -> NSTouchBarItem {
        let item = NSCustomTouchBarItem(identifier: getIdentifier())
        item.view = view
        return item
    }
    
    public func getIdentifier() -> NSTouchBarItem.Identifier {
        return NSTouchBarItem.Identifier(identifier)
    }
}
