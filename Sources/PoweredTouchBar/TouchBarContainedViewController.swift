//
//  TouchBarContainedViewController.swift
//  
//
//  Created by Pavel Kasila on 22.03.21.
//

import AppKit
import SwiftUI

public class TouchBarContainedViewController<Content: View>: NSViewController {
    var content: (() -> Content)!
    
    public override func loadView() {
        self.view = NSHostingView(rootView: content())
    }
}
