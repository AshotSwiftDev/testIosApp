//
//  UIFont + ext.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 20.12.23.
//

import Foundation
import UIKit

extension UIFont {
    
   static func sfProDispalyMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Medium", size: size) ?? .systemFont(ofSize: size)
    }
    
   static func sfProDispalyRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func sfProDispalyBold(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func sfProDispalySemibold(size: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Semibold", size: size) ?? .systemFont(ofSize: size)
    }
        
}
