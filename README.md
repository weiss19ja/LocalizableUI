# LocalizableUI

[![CI Status](http://img.shields.io/travis/weiss19ja/LocalizableUI.svg?style=flat)](https://travis-ci.org/weiss19ja/LocalizableUI)
[![codecov.io](https://codecov.io/gh/weiss19ja/LocalizableUI/branch/master/graphs/badge.svg)](https://codecov.io/gh/weiss19ja/LocalizableUI)
[![Version](https://img.shields.io/cocoapods/v/LocalizableUI.svg?style=flat)](http://cocoapods.org/pods/LocalizableUI)
[![License](https://img.shields.io/cocoapods/l/LocalizableUI.svg?style=flat)](http://cocoapods.org/pods/LocalizableUI)
[![Platform](https://img.shields.io/cocoapods/p/LocalizableUI.svg?style=flat)](http://cocoapods.org/pods/LocalizableUI)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Supported UIElements

* UIBarButtonItem
* UIButton
* UILabel
* UINavigationItem
* UISegmentedControl
* UITabBarItem
* UITableViewCell
* UITextField
* UITextView
* UIView
* UIViewController
* UIAlertController
* UIAlertAction

## Requirements

* iOS 9.0+
* Xcode 9.0+
* Swift 4.0+

## Communication

* If you find any useful element missing please open an issue.
* If you found a bug, open an issue.
* If you want to contribute, submit a pull request.

## Installation

### CocoaPods
LocalizableUI is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LocalizableUI'
```

### Carthage
Add `github "weiss19ja/LocalizableUI"`to your Cartfile.

### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/weiss19ja/LocalizableUI.git", from: "0.3.1")
]
```
## Usage

#### Storyboard
The easiest way to use LocalizableUI is the Storyboard. Here you can enter your Localizable.strings Keys.
![Label](/ScreenShots/Label.png)

For the SegmentedControl you can enter an array of Localizable.strings Keys separated by ",".
![Label](/ScreenShots/segmentedControl.png)

The BackButton can be set in the prior ViewController. Here you can use the ViewController fields in the Storyboard.
![Label](/ScreenShots/ViewController.png)

If you are using an NavigationItem this will override the Title and the BackButton of the ViewController.
![Label](/ScreenShots/NavigationItem.png)

#### Code
##### Localization of Views
It is also possible to set the LocalizableKeys in the Code. This includes all features of the Stotyboard LocalizableKeys

```swift
let newLabel = UILabel(frame: frame)
newLabel.localizedKey = "LocalizedKey"
```

##### AlertViewController
AlertViews must be configured in the code.

```swift
let alertController = UIAlertController(localizedTitle: Constants.titleKey, localizedMessage: Constants.messagekey, preferredStyle: .alert)
let action = UIAlertAction(localzedTitleKey: Constants.buttonKey, style: .cancel, handler: nil)
alertController.addAction(action)
```

##### LocalizedKey to text

```swift
// #1
let localizedText = LocalizationManager.localizedStringFor("LocalizedKey")
// #2
let localizedText = LocalizationManager.localizedStringFor("LocalizedKey", bundle: bundle, value: "", comment: "")
// #3
let localizedText = "LocalizedKey".localized
```

##### Custom View
To localize any class or struct you can simply implement the Localizable Protocol

```swift
extension CustomView: Localizable {
    func updateLocalizedStrings() {
    	/// do your localization stuff
        text = LocalizationManager.localizedStringFor("LocalizedKey")
    }
}
```

##### Language change manual
You can change the language while the app is active. You simply have to use the LocalizationManager changeLanguage(...) method. All your Views will update without any further adjustments.

```swift
do {
	let tableName = "Localizable"
	let bundle = Bundle(for: type(of: self))
	let languageCode = "en"
	try LocalizationManager.sharedInstance.changeLanguage(to: tableName, from: bundle, languageCode: languageCode)
} catch {
	...
}	
```
![Label](/ScreenShots/ExampleApp.gif)

## Authors

Jan Weiß, Philipp Weiß

## License

LocalizableUI is available under the MIT license. See the LICENSE file for more info.
 
