//
//  YDContainerController.swift
//  NavigationController
//
//  Created by 侯亚迪 on 2018/11/22.
//  Copyright © 2018 League of Legens. All rights reserved.
//

import UIKit
import Foundation

class YDContainerController: UIViewController {
    
    // MARK: - property
    
    var topViewController: UIViewController
    
    var singleNavigationController: YDSingleNavigationController
    
    weak var rootNavigationController: YDNavigationController?
    
    
    // MARK: - life
    
    init(topViewController: UIViewController, rootNavigationController: YDNavigationController) {
        
        self.topViewController = topViewController
        self.rootNavigationController = rootNavigationController
        self.singleNavigationController = YDSingleNavigationController(rootNavigationController: rootNavigationController)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extendedLayoutIncludesOpaqueBars = true
        topViewController.extendedLayoutIncludesOpaqueBars = true
        topViewController.edgesForExtendedLayout = .bottom

        singleNavigationController.pushViewController(topViewController, animated: false)
        addChild(singleNavigationController)
        view.backgroundColor = UIColor.white
        view.addSubview(singleNavigationController.view)
    }
    
    
    // MARK: - override
    
    override var title: String? {
        set {}
        get {
            return topViewController.title
        }
    }
    
    override var tabBarItem: UITabBarItem! {
        set {}
        get {
            return topViewController.tabBarItem
        }
    }
    
    override var tabBarController: UITabBarController? {
        return topViewController.tabBarController
    }
    
    override var hidesBottomBarWhenPushed: Bool {
        set {}
        get {
            return topViewController.hidesBottomBarWhenPushed
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return topViewController.canBecomeFirstResponder
    }
    
    override func becomeFirstResponder() -> Bool {
        return topViewController.becomeFirstResponder()
    }
    
    override var prefersStatusBarHidden: Bool {
        return topViewController.prefersStatusBarHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController.preferredStatusBarStyle
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return topViewController.preferredStatusBarUpdateAnimation
    }
    
    override var shouldAutorotate: Bool {
        return topViewController.shouldAutorotate
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController.supportedInterfaceOrientations
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return topViewController.preferredInterfaceOrientationForPresentation
    }
    
    @available(iOS 11.0, *)
    override var childForScreenEdgesDeferringSystemGestures: UIViewController? {
        return topViewController
    }
    
    @available(iOS 11.0, *)
    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return topViewController.preferredScreenEdgesDeferringSystemGestures
    }
    
    @available(iOS 11.0, *)
    override var prefersHomeIndicatorAutoHidden: Bool {
        return topViewController.prefersHomeIndicatorAutoHidden
    }
    
    @available(iOS 11.0, *)
    override var childForHomeIndicatorAutoHidden: UIViewController? {
        return topViewController
    }
}
