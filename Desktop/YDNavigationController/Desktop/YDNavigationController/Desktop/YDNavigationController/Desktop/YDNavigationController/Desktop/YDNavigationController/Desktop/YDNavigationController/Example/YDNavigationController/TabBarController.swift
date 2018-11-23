
//
//  TabBarController.swift
//  YDNavigationController_Example
//
//  Created by 侯亚迪 on 2018/11/23.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import YDNavigationController

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = FirstViewController()
        vc1.title = "首页"
        let nc1 = YDNavigationController(rootViewController: vc1)
//        nc1.backBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(handleBack))
        nc1.navigationBar.barTintColor = UIColor.red
        
        let vc2 = FirstViewController()
        vc2.title = "我的"
        let nc2 = YDNavigationController(rootViewController: vc2)
//        nc2.backBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(handleBack))
        nc2.navigationBar.barTintColor = UIColor.blue
        
        viewControllers = [nc1, nc2]
    }
    
    @objc func handleBack() {
        let nc = selectedViewController as? YDNavigationController
        nc?.popViewController(animated: true)
    }
    
}

