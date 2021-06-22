//
//  DHTTableViewManager.swift
//  DHTTableViewManager
//
//  Created by happyo on 2021/6/22.
//

import Foundation

protocol DHTTableViewManagerDelegate : UIScrollViewDelegate {
    
}

public class DHTTableViewManager : NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var delegate : DHTTableViewManagerDelegate?
    
    private var sections = [DHTTableViewSection]()
    
    weak var tableView : UITableView?
    
    private var registerMaps = [(cellType : UITableViewCell.Type, itemType : DHTTableViewItem.Type)]()
    
    // MARK: Public
    public init(tableView : UITableView) {
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
    }
    
    public func registerCellWithItem<C, I>(_ cell: C.Type, _ item: I.Type) where C : UITableViewCell, I : DHTTableViewItem {
        let tuple = (cellType : cell, itemType : item)
        self.registerMaps.append(tuple)
    }
    
    public func addSection(_ section: DHTTableViewSection) {
        self.sections.append(section)
    }
    
    public func removeAllSections() {
        self.sections.removeAll()
    }
    
    public func reloadData() {
        self.tableView?.reloadData()
    }
    
    // MARK: Private
    
    func typeForCellAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell.Type? {
        if let item = self.itemAtIndexPath(indexPath) {
            return self.registerMaps.filter { tuple in
                let itemTempType = tuple.itemType
                
                return type(of: item) == itemTempType
            }.map { tuple in
                return tuple.cellType
            }.first
        } else {
            return nil
        }
    }
    
    func itemAtIndexPath(_ indexPath: IndexPath) -> DHTTableViewItem? {
        if (indexPath.section < self.sections.count) {
            let sectionModel = self.sections[indexPath.section]
            
            if (indexPath.row < sectionModel.items.count) {
                let itemModel = sectionModel.items[indexPath.row]
                
                return itemModel
            }
        }
        
        return nil
    }
    
    // MARK: UITableViewDataSource
    private func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section < self.sections.count) {
            let sectionModel = self.sections[section]
            return sectionModel.items.count
        } else {
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tempCell: UITableViewCell?
        
        if let cellType = self.typeForCellAtIndexPath(indexPath) {
            let cellIdentifier = String(describing: cellType)
            tempCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            
            var resultCell: UITableViewCell
            
            if let cell = tempCell {
                resultCell = cell
            } else {
                resultCell = cellType.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellIdentifier)
                
                if let cellProtocol = resultCell as? DHTTableViewCellDelegate {
                    cellProtocol.cellDidLoad()
                }
            }
            
            if let cellProtocol = resultCell as? DHTTableViewCellDelegate {
                if let item = self.itemAtIndexPath(indexPath) {
                    cellProtocol.configCellWithItem(item)
                }
            }
            
            return resultCell
        } else {
            print("找不到cellType，可能未注册")
            
            return UITableViewCell()
        }
    }
    
    private func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cellProtocol = cell as? DHTTableViewCellDelegate {
            cellProtocol.cellWillDisplay()
        }
    }
    
    private func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cellProtocol = cell as? DHTTableViewCellDelegate {
            cellProtocol.cellDidEndDisplay()
        }
    }
    
    private func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cellHeight: CGFloat = 0
        
        if let item = self.itemAtIndexPath(indexPath) {
            if let cellType = self.typeForCellAtIndexPath(indexPath) {
                if let cellProtocol = cellType as? DHTTableViewCellDelegate.Type {
                    cellHeight = cellProtocol.heightForCellWithItem(item)
                }
            }
        }
        
        return cellHeight
    }
    
    private func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section < self.sections.count) {
            let sectionModel = self.sections[section]
            
            return sectionModel.headerView
        } else {
            return nil
        }
    }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section < self.sections.count) {
            let sectionModel = self.sections[section]
            
            if let height = sectionModel.headerHeight {
                return height
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    private func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (section < self.sections.count) {
            let sectionModel = self.sections[section]
            
            return sectionModel.footerView
        } else {
            return nil
        }
    }
    
    private func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section < self.sections.count) {
            let sectionModel = self.sections[section]
            
            if let height = sectionModel.footerHeight {
                return height
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
    
    // MARK: UITableViewDelegate
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let item = self.itemAtIndexPath(indexPath) {
//            if
//        }
    }
    
    
}
