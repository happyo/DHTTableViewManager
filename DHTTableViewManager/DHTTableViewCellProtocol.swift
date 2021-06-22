//
//  DHTTableViewCellProtocol.swift
//  DHTTableViewManager
//
//  Created by happyo on 2021/6/22.
//

import Foundation

public protocol DHTTableViewCellDelegate {
    /**
     cell创建的时候调用，只调用一次，类似viewDidLoad
     */
    //
    func cellDidLoad()
    
    /**
     用于获取cell的高度，item可以强转成对应的自定义item
     */
    static func heightForCellWithItem(_ item: DHTTableViewItem) -> CGFloat
    
    /**
     根据item来更新cell，item可以强转成对应的自定义item，此时cell视图大小还未确定
     */
    func configCellWithItem(_ item: DHTTableViewItem)
    
    /**
     cell 即将显示的时候调用
     */
    func cellWillDisplay()
    
    /**
     cell 已经显示的时候调用
     */
    func cellDidEndDisplay()
}

public extension DHTTableViewCellDelegate {
    func cellWillDisplay() {
        
    }
    
    func cellDidEndDisplay() {
        
    }
}
