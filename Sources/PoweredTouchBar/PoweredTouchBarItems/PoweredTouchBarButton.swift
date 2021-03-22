//
//  PoweredTouchBarButton.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import AppKit

public class PoweredTouchBarButton: PoweredTouchBarItem {
    
    var identifier: String
    var item: NSButtonTouchBarItem
    var action: () -> Void
    
    public init(identifier: String, title: String, action: @escaping () -> Void) {
        self.identifier = identifier
        self.item = NSButtonTouchBarItem(identifier: NSTouchBarItem.Identifier(self.identifier), title: title, target: nil, action: #selector(objAction))
        self.action = action
    }
    
    public init(identifier: String, image: NSImage, action: @escaping () -> Void) {
        self.identifier = identifier
        self.item = NSButtonTouchBarItem(identifier: NSTouchBarItem.Identifier(self.identifier), image: image, target: nil, action: #selector(objAction))
        self.action = action
    }
    
    public init(identifier: String, title: String, image: NSImage, action: @escaping () -> Void) {
        self.identifier = identifier
        self.item = NSButtonTouchBarItem(identifier: NSTouchBarItem.Identifier(self.identifier), title: title, image: image, target: nil, action: #selector(objAction))
        self.action = action
    }
    
    public func touchBarItem() -> NSTouchBarItem {
        return item
    }
    
    public func getIdentifier() -> NSTouchBarItem.Identifier {
        return NSTouchBarItem.Identifier(identifier)
    }
    
    @objc func objAction() {
        action()
    }
}
