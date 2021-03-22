//
//  PoweredNSTouchBarItem.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import AppKit

public class PoweredNSTouchBarItem: PoweredTouchBarItem {
    
    var item: NSTouchBarItem
    
    public init(_ item: () -> NSTouchBarItem) {
        self.item = item()
    }
    
    public func touchBarItem() -> NSTouchBarItem {
        return item
    }
    
    public func getIdentifier() -> NSTouchBarItem.Identifier {
        return item.identifier
    }
}
