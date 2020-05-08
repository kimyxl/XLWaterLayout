//
//  TestViewController.swift
//  XLWaterLayoutDemo
//
//  Created by xiaolei on 2020/5/8.
//  Copyright © 2020 xiaolei. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private let cellid = "cellid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //默认为cell高度随机
        //let customLayout = XLWaterLayout.init()
        
        let customLayout = XLWaterLayout.init(columnsNum: 2, columnSpace: 10, rowSpace: 10, edgeInsets: UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)) { (indexPath) -> CGFloat in
            
            if indexPath.item%2 == 0 {
                return 100
            } else {
                return 210
            }
        }
        
        let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height), collectionViewLayout: customLayout)
        collectionView.backgroundColor = UIColor.purple
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: cellid)
        
        
        //模拟请求后，刷新高度
        DispatchAfter_main(after: 6) {
            customLayout.calculateHeightBlock = { (indexPath) -> CGFloat in
                return 200
            }
            collectionView.reloadData()
        }
        
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
