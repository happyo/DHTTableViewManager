//
//  DHTDemoTitleCell.swift
//  DHTTableViewManager_Example
//
//  Created by happyo on 2021/6/22.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import SnapKit
import DHTTableViewManager

class DHTDemoTitleItem : DHTTableViewItem {
    var title = String()
}

class DHTDemoTitleCell : UITableViewCell, DHTTableViewCellDelegate {
    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: Private
    func configSubviews() {
        self.contentView.addSubview(label)
        self.label.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: DHTTableViewCellDelegate
    func cellDidLoad() {
        self.configSubviews()
    }
    
    func configCellWithItem(_ item: DHTTableViewItem) {
        if let titleItem = item as? DHTDemoTitleItem {
            self.label.text = titleItem.title
        }
    }
    
//    static func heightForCellWithItem(_ item: DHTTableViewItem) -> CGFloat {
//        return 100
//    }
}
