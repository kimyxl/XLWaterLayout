//
//  TestCollectionViewCell.swift
//  collectTest
//
//  Created by xiaolei on 2019/2/14.
//  Copyright © 2019 xiaolei. All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    
    private var theLable:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.orange
        let label = UILabel.init()
        label.frame = CGRect.init(x: 5, y: 10, width: 100, height: 15)
        self.contentView.addSubview(label)
        theLable = label
    }
    
    func setData(numL:String) {
        theLable.text = numL
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
