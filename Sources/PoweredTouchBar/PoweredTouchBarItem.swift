//
//  PoweredTouchBarItem.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import AppKit

public protocol PoweredTouchBarItem {
    func touchBarItem() -> NSTouchBarItem
    func getIdentifier() -> NSTouchBarItem.Identifier
}
