//
//  FirstViewController.swift
//  YDNavigationController
//
//  Created by houyadi on 11/23/2018.
//  Copyright (c) 2018 houyadi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "第一页"
        view.addSubview(redBtn)
    }
    
    @objc func handleClick() {
        let secondVC = SecondViewController()
        secondVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(secondVC, animated: true)
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

