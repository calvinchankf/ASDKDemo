//
//  UIKitViewController.swift
//  ASDKDemo
//
//  Created by calvin on 28/1/2017.
//  Copyright © 2017年 me.calvinchankf. All rights reserved.
//

import UIKit

class UIKitViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var items = [[Item]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "UIKitTableCell", bundle: nil), forCellReuseIdentifier: "UIKitTableCell")
        
        let dataModel = DataModel()
        dataModel.fetch { (result) in
            self.items = result
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UIKitViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UIKitTableCell", for: indexPath) as! UIKitTableCell
        cell.items = items[indexPath.row]
        return cell
    }
}

extension UIKitViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 124;
    }
}
