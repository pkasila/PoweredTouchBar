# PoweredTouchBar

PoweredTouchBar is a library which lets you easily and more powerfully use Touch Bar on macOS with SwiftUI.

<img width="700" alt="image" src="https://user-images.githubusercontent.com/17158860/112017767-f9cb1000-8b3e-11eb-82ca-14ad2705f4a8.png">

## How to use it?
There is a simple example of how to use `PoweredTouchBar` library:

<img width="703" alt="image" src="https://user-images.githubusercontent.com/17158860/112017959-28e18180-8b3f-11eb-92dc-e629964a4360.png">

```swift
import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    var body: some View {
        TextEditor(text: $text)
            .poweredTouchBar {
                PoweredTouchBarButton(
                    identifier: "HelloWorld.text",
                    title: "Hello World!",
                    action: {
                        print("You've pressed the button with text")
                    }
                )
                PoweredTouchBarButton(
                    identifier: "HelloWorld.image",
                    image: NSImage(systemSymbolName: "star.fill", accessibilityDescription: nil)!,
                    action: {
                        print("You've pressed the button with image")
                    }
                )
            }
    }
}
```

## How to create your own `PoweredTouchBarItem`?
`PoweredTouchBarItem` is a protocol which basically allows you to create items for Touch Bar.
You can use it to wrap any `NSTouchBarItem` to do so you just need to make a method to get
an identifier (`getIdentifier`) and to get item itself (`touchBarItem`). There is an example below
which shows how you can create a simple wrapper for `NSTouchBarItem` to use them with 
`PoweredTouchBar` (It's already available by importing `PoweredTouchBar`):
```swift
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
```
You can also check out how `NSButtonTouchBarItem` is wrapped in [`PoweredTouchBarButton`](https://github.com/pkosilo/PoweredTouchBar/blob/main/Sources/PoweredTouchBar/PoweredTouchBarItems/PoweredTouchBarButton.swift) to make it work in `PoweredTouchBar`.
