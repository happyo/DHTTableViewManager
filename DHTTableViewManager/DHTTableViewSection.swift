//
//  DHTTableViewSection.swift
//  DHTTableViewManager
//
//  Created by happyo on 2021/6/22.
//

import Foundation

class DHTTableViewSection {
    private(set) var items = [DHTTableViewItem]()
    var headerView : UIView?
    var footerView : UIView?
    var headerHeight : CGFloat?
    var footerHeight : CGFloat?
    
    func addItem(_ item: DHTTableViewItem) {
        self.items.append(item)
    }
    
    func addItems(_ items: [DHTTableViewItem]) {
        self.items.append(contentsOf: items)
    }

    func removeAllItems() {
        self.items.removeAll()
    }
    
}
