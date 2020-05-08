//
//  WaterLayout.swift
//  NewCollectionView
//
//  Created by xiaolei on 2019/2/19.
//  Copyright © 2019 xiaolei. All rights reserved.
//

import UIKit

class XLWaterLayout: UICollectionViewLayout {
    //列数
    private var defaultColumnsNum:Int = 2
    //列间距
    private var defaultColumnSpace:CGFloat = 10
    //行间距
    private var defaultRowSpace:CGFloat = 10
    //距父视图边距
    private var defaultEdgeinsets:UIEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    //计算每个宽度
    private var itemWidth:CGFloat = 0
    
    private var allAttributes = [UICollectionViewLayoutAttributes]()
    private var columnsHeights = [CGFloat]()

    convenience init(columnsNum:Int, columnSpace:CGFloat, rowSpace:CGFloat, edgeInsets:UIEdgeInsets) {
        self.init()
        self.defaultColumnsNum = columnsNum >= 1 ? columnsNum : 2
        self.defaultColumnSpace = columnSpace >= 0 ? columnSpace : 10
        self.defaultRowSpace = rowSpace >= 0 ? rowSpace : 10
        self.defaultEdgeinsets = edgeInsets
    }
    
    override func prepare() {
        super.prepare()
        
        self.allAttributes.removeAll()
        self.columnsHeights.removeAll()
        
        for _ in 0..<self.defaultColumnsNum {
            self.columnsHeights.append(defaultEdgeinsets.top)
        }
        
        let tmpWidth = self.collectionView!.bounds.width-self.defaultEdgeinsets.left-self.defaultEdgeinsets.right-CGFloat(self.defaultColumnsNum-1)*self.defaultColumnSpace
        self.itemWidth = tmpWidth/CGFloat(self.defaultColumnsNum)
        
        let itemsCount = self.collectionView?.numberOfItems(inSection: 0) ?? 0
        for i in 0..<itemsCount {
            let indexpath = IndexPath.init(item: i, section: 0)
            let attr = self.layoutAttributesForItem(at: indexpath)
            self.allAttributes.append(attr!)
        }
        
    }
    
    /*
     * 返回rect中的所有的元素的布局属性
     */
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.allAttributes
    }
    
    /*
     * 返回对应于indexPath的位置的cell的布局属性
     */
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attr = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
        
        var shortestColumnIndex = 0
        var shortestHeight = self.columnsHeights[shortestColumnIndex]
        for (index, height) in self.columnsHeights.enumerated() {
            if shortestHeight > height {
                shortestHeight = height
                shortestColumnIndex = index
            }
        }
        
        let width:CGFloat = self.itemWidth
        let height:CGFloat = CGFloat(100+arc4random_uniform(200))
        
        let originalX:CGFloat = self.defaultEdgeinsets.left + CGFloat(shortestColumnIndex)*(width+self.defaultColumnSpace)
        var originalY:CGFloat = shortestHeight
        if originalY != self.defaultEdgeinsets.top {
            originalY += self.defaultRowSpace
        }
        
        attr.frame = CGRect.init(x: originalX, y: originalY, width: width, height: height)
        self.columnsHeights[shortestColumnIndex] = attr.frame.maxY
        
        return attr
    }
    
    override var collectionViewContentSize: CGSize {
        get {
            var longestHeight = self.columnsHeights[0]
            for height in self.columnsHeights {
                if longestHeight < height {
                    longestHeight = height
                }
            }
            return CGSize.init(width: self.collectionView!.bounds.width, height: longestHeight+self.defaultRowSpace)
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return false
    }
    
}
