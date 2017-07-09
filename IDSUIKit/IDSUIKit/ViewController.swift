//
//  ViewController.swift
//  IDSUIKit
//
//  Created by colfly on 2017/7/9.
//  Copyright © 2017年 colfly. All rights reserved.
//

import UIKit

class ViewController: UIViewController,IDSSegmentedControlDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = IDSSegmentedControl()
        v.delegate = self
        v.backgroundColor = UIColor.red
        self.view .addSubview(v)
    }
    
    func IDSSegmentedSelected(index:Int){
        print(index)
    }
}

