//
//  SharedMethod.swift
//  FreeHands
//
//  Created by Apple on 7/1/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class Method {
    
    class func addShadowAndCornerRadiasTo(cell: UICollectionViewCell, cornerRadias: CGFloat, borderWidth: CGFloat, borderColor: CGColor, shadowColor: CGColor, shadowOffsetWidth: CGFloat, shadowOffsetHeight: CGFloat, shadowRadius: CGFloat){
        cell.layer.cornerRadius = cornerRadias
        cell.layer.borderWidth = borderWidth
        
        cell.layer.borderColor = borderColor
        cell.layer.masksToBounds = true
        
        cell.layer.shadowColor = shadowColor
        cell.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        cell.layer.shadowRadius = shadowRadius
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
    }
    
    class func calculateTabBarHeight(tabController: UITabBarController?) -> CGFloat {
        if let height = tabController?.tabBar.frame.size.height {
            return height
        } else {
            return 50
        }
    }
    
    class func calculateNavigationBarHeight(navigationController: UINavigationController?) -> CGFloat {
        if let height = navigationController?.navigationBar.frame.size.height {
            return height
        } else {
            return 50
        }
    }
    
    @objc class func callNumber(number: String){
        guard let number = URL(string: "tel://" + number) else { return }
        UIApplication.shared.open(number)
    }
    
    class func buildPlaceHolderTextWith(string: String, size: CGFloat, color: UIColor, allignment: NSTextAlignment, underLine: Bool) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: size), NSAttributedStringKey.foregroundColor: color, NSAttributedStringKey.underlineStyle : underLine])
        let myParagraphStyle = NSMutableParagraphStyle()
        myParagraphStyle.alignment = allignment
        attributedString.addAttributes([.paragraphStyle: myParagraphStyle], range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }
    
    static func isConnectedToInternet() -> Bool {
        switch Object.appDelegate.reachability.connection {
        case .wifi:
            return true
        case .cellular:
            return true
        case .none:
            return false
        }
    }
    
}
