//
//  ViewController.swift
//  DHTTableViewManager
//
//  Created by happyo on 06/22/2021.
//  Copyright (c) 2021 happyo. All rights reserved.
//

import UIKit
import DHTTableViewManager

class ViewController: UIViewController {
    var tableView : UITableView!
    var manager: DHTTableViewManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        self.view.addSubview(self.tableView)
        self.manager = DHTTableViewManager(tableView: self.tableView)
        self.manager.registerCellWithItem(DHTDemoTitleCell.self, DHTDemoTitleItem.self)
        
        let section = DHTTableViewSection()
        
        for _ in 0..<10 {
            section.addItem(DHTDemoTitleItem())
        }
        
        self.manager.addSection(section)
        self.manager.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

