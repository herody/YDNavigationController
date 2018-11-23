//
//  YDNavigationController.swift
//  NavigationController
//
//  Created by 侯亚迪 on 2018/11/22.
//  Copyright © 2018 League of Legens. All rights reserved.
//

import UIKit
import Foundation

public class YDNavigationController: UINavigationController {
    
    var containerViewController: YDContainerController?
    
    public var backBarButtonItem: UIBarButtonItem?
    
    // MARK: - life
    
    override public init(rootViewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)

        containerViewController = YDContainerController(topViewController: rootViewController, rootNavigationController: self)
        pushViewController(containerViewController!, animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
    }
    
}



