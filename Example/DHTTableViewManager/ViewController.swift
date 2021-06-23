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
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500), style: .grouped)
        
        self.tableView.estimatedRowHeight = 20
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.manager = DHTTableViewManager(tableView: self.tableView)
        self.manager.registerCellWithItem(DHTDemoTitleCell.self, DHTDemoTitleItem.self)
        
        let section = DHTTableViewSection()
        
        for i in 0..<10 {
            let item = DHTDemoTitleItem()
            var str = "a"
            for _ in 0..<i {
                str += "hahaasdfasdfsadfasdfasdfasdf"
            }
            item.title = str
            section.addItem(item)
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        view.backgroundColor = .red
        
        section.headerView = view
        section.headerHeight = 100
        
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        footerView.backgroundColor = .blue
        
        section.footerView = footerView
        section.footerHeight = 100
        
        self.manager.addSection(section)
        self.manager.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

