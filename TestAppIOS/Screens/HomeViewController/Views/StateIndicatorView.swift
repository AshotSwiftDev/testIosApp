//
//  StateIndicatorView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 17.12.23.
//

import UIKit
import SnapKit
//
//class StateIndicatorView: UIView {
//    
//    // MARK: - Properties
//    private let circleSize: CGFloat = 7.0
//    private let circleSpacing: CGFloat = 5.0
//    private var circleViews: [UIView] = []
//    
//    // MARK: - Init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupUI()
//    }
//    
//    // MARK: - Setup
//    private func setupUI() {
//        self.backgroundColor = .white
//        self.layer.cornerRadius = 5
//        
//        let alphaValues: [CGFloat] = [1, 0.22, 0.17, 0.1, 0.05]
//        for index in 0..<alphaValues.count {
//            let circleView = UIView()
//            circleView.layer.cornerRadius = circleSize / 2
//            circleViews.append(circleView)
//            addSubview(circleView)
//            circleViews[index].backgroundColor = .black
//            circleView.alpha = alphaValues[index]
//        }
//        
//        for (index, circleView) in circleViews.enumerated() {
//            circleView.snp.makeConstraints { make in
//                make.centerY.equalToSuperview()
//                make.left.equalToSuperview().offset(CGFloat(index) * (circleSize + circleSpacing) + circleSpacing + 5)
//                make.size.equalTo(CGSize(width: circleSize, height: circleSize))
//            }
//        }
//    }
//    
//    // MARK: - Update
//    func updateAccent(at index: Int) {
//        for (i, circleView) in circleViews.enumerated() {
//            circleView.alpha = i == index ? 1.0 : 1.0 - CGFloat(i) * 0.2
//        }
//    }
//}

import UIKit
import SnapKit

class StateIndicatorView: UIView {
    
    // MARK: - Properties
    private let circleSize: CGFloat = 7.0
    private let circleSpacing: CGFloat = 5.0
    private var circleViews: [UIView] = []
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI(circleCount: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI(circleCount: 0)
    }
    
    // MARK: - Setup
    func setupUI(circleCount: Int) {
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        
        guard circleCount > 0 else { return }
        
        for circleView in circleViews {
            circleView.removeFromSuperview()
        }
        circleViews.removeAll()
        
        for index in 0..<circleCount {
            let circleView = UIView()
            circleView.layer.cornerRadius = circleSize / 2
            circleViews.append(circleView)
            addSubview(circleView)
            circleView.backgroundColor = .black
            
            circleView.alpha = index == 0 ? 1.0 : max(0.6 - CGFloat(index) * 0.2, 0.0)
        }
        
        for (index, circleView) in circleViews.enumerated() {
            circleView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(CGFloat(index) * (circleSize + circleSpacing) + circleSpacing + 5)
                make.size.equalTo(CGSize(width: circleSize, height: circleSize))
            }
        }
        
        DispatchQueue.main.async {
            let totalWidth = CGFloat(self.circleViews.count) * (self.circleSize + self.circleSpacing) + 15
            self.snp.makeConstraints { make in
                make.width.equalTo(totalWidth)
            }
        }
    }
    
    // MARK: - Update
    func updateAccent(at index: Int) {
        for (i, circleView) in circleViews.enumerated() {
            if i == index {
                
                circleView.alpha = 1.0
            } else {
                
                let distance = abs(index - i)
                circleView.alpha = max(0.6 - CGFloat(distance) * 0.2, 0.0)
            }
        }
    }
}
