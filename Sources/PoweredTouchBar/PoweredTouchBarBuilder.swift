//
//  PoweredTouchBarBuilder.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import Foundation

@_functionBuilder struct PoweredTouchBarBuilder {
    static func buildBlock(_ atrs: PoweredTouchBarItem...) -> [PoweredTouchBarItem] {
        return atrs
    }
}
