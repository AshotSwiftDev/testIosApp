//
//  DividerView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 20.12.23.
//

import UIKit

class DividerView : UIView {
    
    init() {
        
        super.init(frame: .zero)
        self.clipsToBounds = true
        self.backgroundColor = .separatorColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
}
