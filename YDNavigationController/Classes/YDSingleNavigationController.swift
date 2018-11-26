//
//  YDSingleNavigationController.swift
//  NavigationController
//
//  Created by 侯亚迪 on 2018/11/22.
//  Copyright © 2018 League of Legens. All rights reserved.
//

import UIKit
import Foundation

class YDSingleNavigationController: UINavigationController {
    
    weak var rootNavigationController: YDNavigationController?
    
    init(rootNavigationController: YDNavigationController) {
        
        self.rootNavigationController = rootNavigationController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.isEnabled = false
        
        if let rootNavigationController = rootNavigationController {
            navigationBar.isTranslucent = rootNavigationController.navigationBar.isTranslucent
            navigationBar.tintColor = rootNavigationController.navigationBar.tintColor
            navigationBar.barTintColor = rootNavigationController.navigationBar.barTintColor
            navigationBar.barStyle = rootNavigationController.navigationBar.barStyle
            navigationBar.backgroundColor = rootNavigationController.navigationBar.backgroundColor
            navigationBar.titleTextAttributes = rootNavigationController.navigationBar.titleTextAttributes
            let backgroundImage = rootNavigationController.navigationBar.backgroundImage(for: .default)
            navigationBar.setBackgroundImage(backgroundImage, for: .default)
            navigationBar.shadowImage = rootNavigationController.navigationBar.shadowImage
            navigationBar.backIndicatorImage = rootNavigationController.navigationBar.backIndicatorImage
            navigationBar.backIndicatorTransitionMaskImage = rootNavigationController.navigationBar.backIndicatorTransitionMaskImage
        }
    }
    
    // MARK: - override
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            let containerVC = YDContainerController(topViewController: viewController, rootNavigationController: rootNavigationController!)
            if rootNavigationController?.backBarButtonItem != nil {
                containerVC.topViewController.navigationItem.leftBarButtonItem = rootNavigationController?.backBarButtonItem
            } else {
                let image = UIImage(named: "back", in: Bundle(for: YDNavigationController.self), compatibleWith: nil)
                containerVC.topViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleBack))
            }
            navigationController?.pushViewController(containerVC, animated: animated)
        } else {
            super.pushViewController(viewController, animated: animated)
        }
    }
    
    @discardableResult
    override func popViewController(animated: Bool) -> UIViewController? {
        guard let containerVC = navigationController?.popViewController(animated: animated) as? YDContainerController else {
            return super.popViewController(animated: animated)
        }
        return containerVC.topViewController
    }
    
    @discardableResult
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        guard let containerVCs = navigationController?.popToRootViewController(animated: animated) as? [YDContainerController] else {
            return super.popToRootViewController(animated: animated)
        }
        return containerVCs.compactMap({$0.topViewController})
    }
    
    @discardableResult
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        guard let containerVCs = navigationController?.popToViewController(viewController, animated: animated) as? [YDContainerController] else {
            return super.popToViewController(viewController, animated: animated)
        }
        return containerVCs.compactMap({$0.topViewController})
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        if navigationController != nil {
            navigationController?.setViewControllers(viewControllers, animated: animated)
        } else {
            super.setViewControllers(viewControllers, animated: animated)
        }
    }
    
    override var delegate: UINavigationControllerDelegate? {
        didSet {
            navigationController?.delegate = delegate
        }
    }
    
    override var topViewController: UIViewController? {
        guard let containerVC = navigationController?.topViewController as? YDContainerController else {
            return super.topViewController
        }
        return containerVC.topViewController
    }
    
    override var viewControllers: [UIViewController] {
        set {
            if navigationController != nil {
                navigationController?.viewControllers = newValue
            } else {
                super.viewControllers = newValue
            }
        }
        get {
            guard let containerVCs = navigationController?.viewControllers as? [YDContainerController] else {
                return super.viewControllers
            }
            return containerVCs.compactMap({$0.topViewController})
        }
    }
    
    override var visibleViewController: UIViewController? {
        guard let containerVC = navigationController?.visibleViewController as? YDContainerController else {
            return super.visibleViewController
        }
        return containerVC.topViewController
    }
    
    // MARK: - event
    
    @objc func handleBack() {
        popViewController(animated: true)
    }
}
