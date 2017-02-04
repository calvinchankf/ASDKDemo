//
//  UIKitTableCell.swift
//  ASDKDemo
//
//  Created by calvin on 28/1/2017.
//  Copyright © 2017年 me.calvinchankf. All rights reserved.
//

import UIKit

class UIKitTableCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var items = [Item]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(UINib.init(nibName: "UIKitCollectionCell", bundle: nil), forCellWithReuseIdentifier: "UIKitCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIKitTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UIKitCollectionCell", for: indexPath) as! UIKitCollectionCell
        
        if indexPath.item < items.count {
            cell.displayCell(items[indexPath.item])
        }
        
        return cell
    }
}

extension UIKitTableCell: UICollectionViewDelegate {
    
}

extension UIKitTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 4, left: 4, bottom: 0, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
