//
//  UITextFieldAnimateView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 22.12.23.
//

import UIKit
import SnapKit

class UITextFieldAnimateView: UIView {
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.font = .sfProDispalyRegular(size: 16)
        textField.returnKeyType = .done
        textField.textColor = .black
        textField.addTarget(nil, action:Selector(("firstResponderAction:")), for:.editingDidEndOnExit)
        return textField
    }()
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textFieldDarkGray
        return label
    }()
    
    private var placeholderTopConstraint: Constraint?
    private var textFieldBottomConstraint: Constraint?
    
    var height: CGFloat?
    
    private var isTextEmpty = true
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(textField)
        self.addSubview(placeholderLabel)
        
        self.snp.makeConstraints { make in
            make.height.equalTo(height ?? 52)
        }
        
        textField.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).inset(16)
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top)
            textFieldBottomConstraint = make.bottom.equalTo(self.snp.bottom).constraint
        }
        
        placeholderLabel.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).inset(16)
            self.placeholderTopConstraint = make.centerY.equalTo(textField.snp.centerY).constraint
        }
        
        textField.addTarget(self, action: #selector(textFieldTextChanged), for: .editingChanged)
        updatePlaceholderLabel()
    }
    
    @objc private func textFieldTextChanged() {
        updatePlaceholderLabel()
    }
   
    private func updatePlaceholderLabel() {
        guard let text = textField.text else { return }
        
        if text.isEmpty != isTextEmpty {
            isTextEmpty = text.isEmpty
            
            if isTextEmpty {
                placeholderLabel.font = .sfProDispalyRegular(size: 17)
                self.placeholderTopConstraint?.update(offset: 0)
                textFieldBottomConstraint?.update(offset: 0)
            } else {
                placeholderLabel.font = .sfProDispalyRegular(size: 12)
                self.placeholderTopConstraint?.update(offset: -textField.frame.height / 3)
                textFieldBottomConstraint?.update(offset: 6)
            }
        }
    }
    
    func setupTextField(placeholder: String) {
        self.placeholderLabel.text = placeholder
        updatePlaceholderLabel()
    }
}
