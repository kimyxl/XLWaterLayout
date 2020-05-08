//
//  XLWaterLayoutDemo.swift
//  NewCollectionView
//
//  Created by xiaolei on 2019/2/19.
//  Copyright © 2019 xiaolei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        let button = UIButton.init(type: .custom)
        button.setTitle("click", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(push), for: .touchUpInside)
        button.frame = CGRect.init(x: 100, y: 300, width: 50, height: 30)
        self.view.addSubview(button)
        
    }
    
    @objc private func push() {
        let vc = TestViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


