//
//  XLWaterLayoutDemo.swift
//  NewCollectionView
//
//  Created by xiaolei on 2019/2/19.
//  Copyright © 2019 xiaolei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let cellid = "cellid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customLayout = XLWaterLayout.init()
        
        let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 20, width: self.view.bounds.width, height: self.view.bounds.height-20), collectionViewLayout: customLayout)
        collectionView.backgroundColor = UIColor.purple
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: cellid)
        
    }
    //---- UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! TestCollectionViewCell
        cell.setData(numL: "\(indexPath.item)")
        return cell
    }
    //---- UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}


