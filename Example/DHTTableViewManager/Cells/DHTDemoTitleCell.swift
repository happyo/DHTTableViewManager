//
//  DHTDemoTitleCell.swift
//  DHTTableViewManager_Example
//
//  Created by happyo on 2021/6/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation

import DHTTableViewManager

class DHTDemoTitleItem : DHTTableViewItem {
    var title = String()
}

class DHTDemoTitleCell : UITableViewCell, DHTTableViewCellDelegate {
    var label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configSubviews()
    }
    
    // MARK: Private
    func configSubviews() {
        self.addSubview(label)
    }
    
    // MARK: DHTTableViewCellDelegate
    func cellDidLoad() {
        
    }
    
    func configCellWithItem(_ item: DHTTableViewItem) {
        self.label.text = "adfhlsadfhlsjdfl;sajdflksdf"
    }
    
    static func heightForCellWithItem(_ item: DHTTableViewItem) -> CGFloat {
        return 100
    }
    
    func cellWillDisplay() {
        
    }
    
    func cellDidEndDisplay() {
        
    }
}
