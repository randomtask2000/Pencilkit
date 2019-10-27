# PencilkitSwiftUI

[![CI Status](https://img.shields.io/travis/notemate/Pencilkit.svg?style=flat)](https://travis-ci.org/notemate/Pencilkit)
[![Version](https://img.shields.io/cocoapods/v/PencilkitSwiftUI.svg?style=flat)](https://cocoapods.org/pods/PencilkitSwiftUI)
[![License](https://img.shields.io/cocoapods/l/PencilkitSwiftUI.svg?style=flat)](https://cocoapods.org/pods/PencilkitSwiftUI)
[![Platform](https://img.shields.io/cocoapods/p/PencilkitSwiftUI.svg?style=flat)](https://cocoapods.org/pods/PencilkitSwiftUI)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

PencilkitSwiftUI is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PencilkitSwiftUI'
```

## Example

```swift
import Combine
import SwiftUI
import PencilkitSwiftUI

struct EditorView: View {
    @State var canvasChangeObservable = CurrentValueSubject<Data?, Never>(nil)
    @State var canvasData: Data? = nil

    var body: some View {
        GeometryReader { reader in
            PKCanvasRepresentation(observable: self.canvasChangeObservable, data: self.canvasData)
                    .frame(maxWidth: .infinity, idealHeight: reader.size.height, alignment: .topLeading)
                    .background(Color.white)
        }
    }
}
```

## Author

notemate, yagiznizipli@me.com

## License

PencilkitSwiftUI is available under the MIT license. See the LICENSE file for more info.
