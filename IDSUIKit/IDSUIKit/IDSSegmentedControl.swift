//
//  IDSSegmentedControl.swift
//  IDSUIKit
//
//  Created by colfly on 2017/7/9.
//  Copyright © 2017年 colfly. All rights reserved.
//

import UIKit

protocol IDSSegmentedControlDelegate {
    func IDSSegmentedSelected(index:Int)
}

class IDSSegmentedControl: UIView {
    
    fileprivate lazy var layer1 = { () -> CAShapeLayer in 
        let v = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint.init(x: 85, y: 60))
        linePath.addLine(to: CGPoint.init(x: 95, y: 50))
        linePath.addLine(to: CGPoint.init(x: 105, y: 60))
        linePath.close()
        v.path = linePath.cgPath
        v.fillColor = UIColor.white.cgColor
        v.fillRule = kCAFillRuleEvenOdd
        return v
    }()
    
    fileprivate lazy var layer2 = { () -> CAShapeLayer in 
        let v = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint.init(x: 270, y: 60))
        linePath.addLine(to: CGPoint.init(x: 280, y: 50))
        linePath.addLine(to: CGPoint.init(x: 290, y: 60))
        linePath.close()
        v.path = linePath.cgPath
        v.fillColor = UIColor.white.cgColor
        v.fillRule = kCAFillRuleEvenOdd
        return v
    }()
    
    var delegate:IDSSegmentedControlDelegate?
    
    convenience init() {
        let frame = CGRect(x: 0, y: 100, width: 375, height: 60)
        self.init(frame: frame)
        let seg = UISegmentedControl(items: ["测试1","测试2"])
        seg.frame = CGRect(x: 0, y: 0, width: 375, height: 60)
        seg.tintColor = UIColor.clear
        
        let normalText = [NSFontAttributeName:UIFont.systemFont(ofSize:20),NSForegroundColorAttributeName:UIColor(white: 1, alpha: 0.5)]
        let selectedText = [NSFontAttributeName:UIFont.systemFont(ofSize:20),NSForegroundColorAttributeName:UIColor.white]
        
        seg.setTitleTextAttributes(normalText, for: .normal)
        seg.setTitleTextAttributes(selectedText, for: .selected)
        
        seg.selectedSegmentIndex = 0
        seg.layer.addSublayer(self.layer1)
        
        seg .addTarget(self, action: #selector(segValueChanged(sender:)), for: .valueChanged)
        self .addSubview(seg)
    }
    
    @objc func segValueChanged(sender:UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            self.layer.addSublayer(self.layer1)
            self.layer2.removeFromSuperlayer()
            break
            
        case 1:
            self.layer.addSublayer(self.layer2)
            self.layer1.removeFromSuperlayer()
            break
            
        default:
            break
        }
        self.delegate?.IDSSegmentedSelected(index: sender.selectedSegmentIndex)
    }
}


