//
//  StateIndicatorView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 17.12.23.
//

import UIKit
import SnapKit

class StateIndicatorView: UIView {
    
    private let circleSize: CGFloat = 7.0
    private let circleSpacing: CGFloat = 5.0
    private var circleViews: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        
        let alphaValues: [CGFloat] = [1, 0.22, 0.17, 0.1, 0.05]
        for index in 0..<alphaValues.count {
            let circleView = UIView()
            circleView.layer.cornerRadius = circleSize / 2
            circleViews.append(circleView)
            addSubview(circleView)
            circleViews[index].backgroundColor = .black
            circleView.alpha = alphaValues[index]
        }
        
        for (index, circleView) in circleViews.enumerated() {
            circleView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(CGFloat(index) * (circleSize + circleSpacing) + circleSpacing + 5)
                make.size.equalTo(CGSize(width: circleSize, height: circleSize))
            }
        }
    }
    
    func updateAccent(at index: Int) {
        for (i, circleView) in circleViews.enumerated() {
            circleView.alpha = i == index ? 1.0 : 1.0 - CGFloat(i) * 0.2
        }
    }
}
