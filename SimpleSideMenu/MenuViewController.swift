//
//  MenuViewController.swift
//  SimpleSideMenu
//
//  Created by Victor Doshchenko on 20.04.2020.
//  Copyright © 2020 Victor Doshchenko. All rights reserved.
//
//  Very simple example of using Left Side Menu with modern nice interface (also known as Hamburger, Burger menu
//  for iOS/Cupertino or Navigation Drawer for Android/Material) together with Tab Bar Controller on one screen.
//  Pan gestures included. Special thanks to Jon Kent https://github.com/jonkykong/SideMenu
//  Actually only 15 lines of code, available for all beginners in iOS
//  Enjoy and Good Luck :-)

import UIKit
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
