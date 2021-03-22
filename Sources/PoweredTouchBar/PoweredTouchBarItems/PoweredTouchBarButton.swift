//
//  PoweredTouchBarButton.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import AppKit

public class PoweredTouchBarButton: NSObject, PoweredTouchBarItem {
    
    var identifier: String
    var itemBuilder: (PoweredTouchBarButton) -> NSButtonTouchBarItem
    var action: () -> Void
    
    public init(identifier: String, title: String, action: @escaping () -> Void) {
        self.identifier = identifier
        self.action = action
        self.itemBuilder = {
            NSButtonTouchBarItem(identifier: NSTouchBarItem.Identifier(identifier), title: title, target: $0, action: #selector(self.objAction))
        }
    }
    
    public init(identifier: String, image: NSImage, action: @escaping () -> Void) {
        self.identifier = identifier
        self.action = action
        self.itemBuilder = {
            NSButtonTouchBarItem(identifier: NSTouchBarItem.Identifier(identifier), image: image, target: $0, action: #selector(self.objAction))
        }
    }
    
    public init(identifier: String, title: String, image: NSImage, action: @escaping () -> Void) {
        self.identifier = identifier
        self.action = action
        self.itemBuilder = {
            NSButtonTouchBarItem(identifier: NSTouchBarItem.Identifier(identifier), title: title, image: image, target: $0, action: #selector(self.objAction))
        }
    }
    
    public func touchBarItem() -> NSTouchBarItem {
        return itemBuilder(self)
    }
    
    public func getIdentifier() -> NSTouchBarItem.Identifier {
        return NSTouchBarItem.Identifier(identifier)
    }
    
    @objc func objAction(_ sender: Any) {
        action()
    }
}
