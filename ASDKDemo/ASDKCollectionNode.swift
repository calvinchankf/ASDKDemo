//
//  ASDKCollectionNode.swift
//  ASDKDemo
//
//  Created by calvin on 30/1/2017.
//  Copyright © 2017年 me.calvinchankf. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ASDKCollectionNode: ASCellNode {
    let imageNode = ASNetworkImageNode()
    let titleNode = ASTextNode()
    
    init(_ item: Item) {
        super.init()
        
        imageNode.contentMode = .scaleAspectFill
        imageNode.cornerRadius = 4
        imageNode.clipsToBounds = true
        imageNode.url = item.imgURL
        
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 2, height: 2)
        shadow.shadowColor = UIColor.gray
        
        let titleAtt = [
            NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 20.0)!,
            NSForegroundColorAttributeName: UIColor.white,
            NSShadowAttributeName: shadow
        ]
        let titleString = NSAttributedString(string: item.title, attributes: titleAtt)
        titleNode.attributedText = titleString
        
        self.automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        imageNode.style.preferredSize = CGSize.init(width: 120, height: 120)
        
        let textCenterSpec = ASCenterLayoutSpec(centeringOptions:.XY, sizingOptions: .minimumX, child: titleNode)
        
        return ASOverlayLayoutSpec(child: imageNode, overlay: textCenterSpec)
    }
}
