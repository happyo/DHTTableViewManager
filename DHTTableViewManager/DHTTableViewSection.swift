//
//  DHTTableViewSection.swift
//  DHTTableViewManager
//
//  Created by happyo on 2021/6/22.
//

import Foundation

public class DHTTableViewSection {
    private(set) var items = [DHTTableViewItem]()
    public var headerView : UIView?
    public var footerView : UIView?
    public var headerHeight : CGFloat?
    public var footerHeight : CGFloat?
    
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
