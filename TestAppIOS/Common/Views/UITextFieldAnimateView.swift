//
//  UITextFieldAnimateView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 22.12.23.
//

import UIKit
import SnapKit

class UITextFieldAnimateView: UIView {
    
    enum TextFieldType {
        case normal
        case phone
    }
    
    var fieldType: TextFieldType = .normal {
        didSet {
            updatePlaceholderLabel()
        }
    }
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 16)
        textField.returnKeyType = .done
        textField.textColor = .black
        textField.addTarget(nil, action: #selector(firstResponderAction), for: .editingDidEndOnExit)
        return textField
    }()
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
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
        self.textField.delegate = self
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
        
        if fieldType == .phone {
            textField.text = formatPhoneNumber(text)
        }
        
        if text.isEmpty != isTextEmpty {
            isTextEmpty = text.isEmpty
            
            if isTextEmpty {
                placeholderLabel.font = .systemFont(ofSize: 17)
                self.placeholderTopConstraint?.update(offset: 0)
                textFieldBottomConstraint?.update(offset: 0)
            } else {
                placeholderLabel.font = .systemFont(ofSize: 12)
                self.placeholderTopConstraint?.update(offset: -textField.frame.height / 3)
                textFieldBottomConstraint?.update(offset: 6)
            }
        }
    }
    
    func setupTextField(placeholder: String, type: TextFieldType) {
        self.placeholderLabel.text = placeholder
        self.fieldType = type
        updatePlaceholderLabel()
    }
    
    @objc private func firstResponderAction() {
        
    }
}

extension UITextFieldAnimateView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    private func formatPhoneNumber(_ phoneNumber: String) -> String {
        var cleanedPhoneNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        if cleanedPhoneNumber.count > 11 {
            cleanedPhoneNumber = String(cleanedPhoneNumber.prefix(11))
        }
        
        var formattedNumber = ""
        
        for (index, digit) in cleanedPhoneNumber.enumerated() {
            switch index {
            case 0:
                formattedNumber += "+\(digit)"
            case 1:
                formattedNumber += " (\(digit)"
            case 3:
                formattedNumber += "\(digit)) "
            case 6, 8:
                formattedNumber += "\(digit)-"
            default:
                formattedNumber += "\(digit)"
            }
        }
        
        return formattedNumber
    }
}
