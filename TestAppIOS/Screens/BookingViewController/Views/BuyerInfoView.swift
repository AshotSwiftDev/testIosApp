//
//  BuyerInfoView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 28.12.23.
//

import UIKit

class BuyerInfoView: UIView {
    
    lazy private var buyerInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProDispalyMedium(size: 22)
        label.text = "Информация о покупателе"
        label.textColor = .black
        return label
    }()
    
    lazy private var phoneNumberField: UITextFieldAnimateView = {
        let view = UITextFieldAnimateView()
        view.setupTextField(placeholder: "Номер телефона", type: .phone)
        view.height = 70
        view.textField.keyboardType = .phonePad
        view.backgroundColor = .backgroundColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy private var emailField: UIView = {
        let view = UITextFieldAnimateView()
        view.setupTextField(placeholder: "Почта", type: .normal)
        view.height = 70
        view.backgroundColor = .backgroundColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy private var privacyInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту"
        label.numberOfLines = 2
        label.font = .sfProDispalyRegular(size: 14)
        label.textColor = .textColorGray
        return label
    }()
    
    //MARK: - Init
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setupUI() {
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        
        self.addSubview(buyerInfoLabel)
        self.addSubview(phoneNumberField)
        self.addSubview(emailField)
        self.addSubview(privacyInfoLabel)
        
        buyerInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(16)
            make.left.equalTo(self.snp.left).inset(16)
        }
        
        phoneNumberField.snp.makeConstraints { make in
            make.top.equalTo(buyerInfoLabel.snp.bottom).inset(-20)
            make.left.equalTo(self.snp.left).inset(16)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        emailField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberField.snp.bottom).inset(-8)
            make.left.equalTo(self.snp.left).inset(16)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        privacyInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(emailField.snp.bottom).inset(-8)
            make.left.equalTo(self.snp.left).inset(16)
            make.right.equalTo(self.snp.right).inset(16)
            make.bottom.equalTo(self.snp.bottom).inset(16)
        }
    }
}
