//
//  ASDKCellNode.swift
//  ASDKDemo
//
//  Created by calvin on 30/1/2017.
//  Copyright © 2017年 me.calvinchankf. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ASDKTableNode: ASCellNode {

    var collectionNode: ASCollectionNode!
    var items = [Item]()
    
    init(_ items: [Item]) {
    
        super.init()
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 120, height: 120)
        flowLayout.sectionInset = UIEdgeInsets.init(top: 4, left: 4, bottom: 0, right: 4)
        flowLayout.minimumLineSpacing = 4
        flowLayout.minimumInteritemSpacing = 0 // actually i forgot what it is...lol
        
        collectionNode = ASCollectionNode.init(collectionViewLayout: flowLayout)
        collectionNode.dataSource = self
        collectionNode.delegate = self
        
        collectionNode.style.preferredSize = CGSize.init(width: UIScreen.main.bounds.width, height: 124)
        
        self.automaticallyManagesSubnodes = true
        
        self.items = items
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0), child: self.collectionNode)
    }
    
}


extension ASDKTableNode: ASCollectionDataSource {
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        let item = items[indexPath.item]
        return {
            return ASDKCollectionNode(item)
        }
    }
}

extension ASDKTableNode: ASCollectionDelegate {
    
}
