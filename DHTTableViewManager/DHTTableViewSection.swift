//
//  DHTTableViewSection.swift
//  DHTTableViewManager
//
//  Created by happyo on 2021/6/22.
//

import Foundation

public class DHTTableViewSection {
    private(set) var items = [DHTTableViewItem]()
    var headerView : UIView?
    var footerView : UIView?
    var headerHeight : CGFloat?
    var footerHeight : CGFloat?
    
    public init() {
        
    }
    
    public func addItem(_ item: DHTTableViewItem) {
        self.items.append(item)
    }
    
    public func addItems(_ items: [DHTTableViewItem]) {
        self.items.append(contentsOf: items)
    }

    public func removeAllItems() {
        self.items.removeAll()
    }
    
}
