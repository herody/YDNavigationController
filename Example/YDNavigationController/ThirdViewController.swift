//
//  ThirdViewController.swift
//  YDNavigationController_Example
//
//  Created by 侯亚迪 on 2018/11/23.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "第三页"
        view.addSubview(redBtn)
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc func handleClick() {
        navigationController?.popViewController(animated: true)
    }
    
    lazy var redBtn: UIButton = {
        let make = UIButton(type: .system)
        make.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        make.backgroundColor = UIColor.red
        make.setTitle("pop", for: .normal)
        make.addTarget(self, action: #selector(handleClick), for: .touchUpInside)
        return make
    }()

}
