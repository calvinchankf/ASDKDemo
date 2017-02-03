//
//  UIKitCollectionCell.swift
//  ASDKDemo
//
//  Created by calvin on 28/1/2017.
//  Copyright © 2017年 me.calvinchankf. All rights reserved.
//

import UIKit
import AlamofireImage

class UIKitCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 4.0
    }
    
    func displayCell(_ item: Item) {
        imageView.af_setImage(withURL: item.imgURL)
//        titleLabel.text = item.title
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 2, height: 2)
        shadow.shadowColor = UIColor.gray
        
        let titleAtt = [
            NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 20.0)!,
            NSForegroundColorAttributeName: UIColor.white,
            NSShadowAttributeName: shadow
        ]
        let titleString = NSAttributedString(string: item.title, attributes: titleAtt)
        titleLabel.attributedText = titleString
    }

}
