//
//  ASDKViewController.swift
//  ASDKDemo
//
//  Created by calvin on 28/1/2017.
//  Copyright © 2017年 me.calvinchankf. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ASDKViewController: ASViewController<ASDisplayNode> {
    
    let tableNode = ASTableNode(style:.plain)
    var items = [[Item]]()
    
    init() {
        super.init(node: tableNode)
        
        self.tableNode.view.separatorStyle = .none
        self.tableNode.view.showsHorizontalScrollIndicator = false
        self.tableNode.dataSource = self
        self.tableNode.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let dataModel = DataModel()
        dataModel.fetch { (result) in
            self.items = result
            self.tableNode.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ASDKViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let temp = self.items[indexPath.row]
        return {
            let cell = ASDKTableNode(temp)
            return cell
        }
    }
}

extension ASDKViewController: ASTableDelegate {
    // no need to calculate the height
    // no action upon selection
}
