# ChainLayout

Light extension for UIView and NSLayoutConstraint for building UI with iOS AutoLayout.
It helps to create an array of constraints and activate them in one call.
There are two ways to access the extension:
- call 'add(into: UIView)', that adds view as the subview and returns the layout wrapper
- refence to 'cl' property of the UIView object

At the end all constraints should be activated. Method 'done' activates all constraits and returns the original object with original type.
The wrapper provides access to constraints by index. It's possible to reference the constraint for further manipulations.

## Examples

```swift
//fill parent view
let container = UIView().add(into: view).fill().done()
//add button in right-bootm corner with 'submit' as a handler
UIButton().add(into: view)
    .width(200)
    .height(50)
    .trailing(16)
    .bottom(16)
    .done()
    .addTarget(self, action: #selector(submit), for: .touchUpInside)
```

## Requirements

iOS 9.0+

## Author

Dmitry Kurkin, kurd1983@gmail.com

## License

ChainLayout is available under the MIT license. See the LICENSE file for more info.
