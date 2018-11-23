//
//  SecondViewController.swift
//  YDNavigationController_Example
//
//  Created by 侯亚迪 on 2018/11/23.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "第二页"
        view.addSubview(redBtn)
        navigationController?.navigationBar.barTintColor = UIColor.orange
    }
    
    @objc func handleClick() {
        let thirdVC = ThirdViewController()
        thirdVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    lazy var redBtn: UIButton = {
        let make = UIButton(type: .system)
        make.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        make.backgroundColor = UIColor.red
        make.setTitle("push", for: .normal)
        make.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        return make
    }()
}
