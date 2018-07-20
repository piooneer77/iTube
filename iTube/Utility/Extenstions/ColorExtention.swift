//
//  ColorExtention.swift
//  FreeHands
//
//  Created by Apple on 7/1/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init (red: CGFloat, green: CGFloat, blue: CGFloat){
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
