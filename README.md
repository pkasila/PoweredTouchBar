# PoweredTouchBar

PoweredTouchBar is a library which lets you easily and more powerfully use Touch Bar on macOS with SwiftUI.

## How to use it?
There is a simple example of how to use `PoweredTouchBar` library:
```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        TextEditor(text: $text)
            .poweredTouchBar {
                PoweredTouchBarButton(
                    identifier: "HelloWorld",
                    title: "Hello World!",
                    action: {
                        print("Yeah, it works!")
                    }
                )
            }
    }
}
```
