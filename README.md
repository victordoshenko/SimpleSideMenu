# ▤ SimpleSideMenu
[![Cocoapods compatible](http://img.shields.io/travis/CocoaPods/CocoaPods/master.svg?style=flat)](https://travis-ci.org/CocoaPods/CocoaPods)

Very simple example of using Left Side Menu with modern nice interface also known as Hamburger, Burger menu for iOS/Cupertino or Navigation Drawer for Android/Material) together with Tab Bar Controller on one screen. Pan gestures included. Special thanks to Jon Kent https://github.com/jonkykong/SideMenu. Actually only 15 lines of code!

### If you like SimpleSideMenu, give it a ★ at the top right of this page.

### Preview Sample
![](https://raw.githubusercontent.com/victordoshenko/SimpleSideMenu/master/SimpleSideMenu.gif)
## Requirements
- [x] Xcode 11.
- [x] Swift 5.
- [x] iOS 10 or higher.

## Installation
### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SideMenu into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

pod 'SideMenu'

# For Swift 5 use:
# pod 'SideMenu', '~> 6.0'

# For Swift 4.2 (no longer maintained) use:
# pod 'SideMenu', '~> 5.0'
```

Then, run the following command:

```bash
$ pod install
```
### Code Implementation
First:
```swift
import SideMenu
```

Your main menu view controller like this:
``` swift
import SideMenu

class MenuViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isTranslucent = false
        let Menu = storyboard?.instantiateViewController(withIdentifier: "SideMenuNavigation") as? SideMenuNavigationController
        Menu?.leftSide = true
        Menu?.settings = makeSettings()
        SideMenuManager.default.leftMenuNavigationController = Menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else { return }
        sideMenuNavigationController.leftSide = true
        sideMenuNavigationController.settings = makeSettings()
    }
    
    private func makeSettings() -> SideMenuSettings {
        let presentationStyle = SideMenuPresentationStyle.menuSlideIn
        presentationStyle.backgroundColor = .gray
        presentationStyle.presentingEndAlpha = 0.5
        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        return settings
    }

}
