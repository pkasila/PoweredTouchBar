//
//  PoweredTouchBarButton.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import AppKit

public class PoweredTouchBarButton: PoweredTouchBarItem {
    
    var identifier: String
    var title: String
    var action: () -> Void
    
    public init(identifier: String, title: String, action: @escaping () -> Void) {
        self.identifier = identifier
        self.title = title
        self.action = action
    }
    
    public func touchBarItem() -> NSTouchBarItem {
        let item = NSCustomTouchBarItem(identifier: getIdentifier())
        item.view = NSButton(title: title, target: nil, action: #selector(objAction))
        return item
    }
    
    public func getIdentifier() -> NSTouchBarItem.Identifier {
        return NSTouchBarItem.Identifier(identifier)
    }
    
    @objc func objAction() {
        action()
    }
}
