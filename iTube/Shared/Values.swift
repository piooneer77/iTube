//
//  Values.swift
//  iTube
//
//  Created by Apple on 7/20/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class Values {
    
    static let darkColor = UIColor(red: 42, green: 43, blue: 54)
    static let cellTitleColor = UIColor.white
    static let cellSubTitleColor = UIColor.gray
    static let tintColor = UIColor(red: 250, green: 0, blue: 128)
    
    static let defaultPadding: CGFloat = 10
    static let defaultCellHeight: CGFloat = 65
    
    static let settingsIcon = UIImage(named: "settingsIcon-Small")
    static let favourateIcon = UIImage(named: "favourateIcon-Small")
    static let gridIcon = UIImage(named: "gridIcon-Small")
    
    class CellId {
        static let categoryCellId: String = "categoryCellId"
        static let favouriteCellId: String = "favouriteCellId"
    }
    
    
}
