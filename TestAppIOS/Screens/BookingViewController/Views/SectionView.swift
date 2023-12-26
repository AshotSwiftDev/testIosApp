//
//  BuyerInformationView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 22.12.23.
//

import UIKit

class SectionView: UIView {
    
    private var isHiddenStackView = false {
        didSet {
            updateViewHeight()
        }
    }
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProDispalyMedium(size: 22)
        label.textColor = .black
        return label
    }()
    
    lazy private var showInfoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "chevron_up_icon"), for: .normal)
        button.backgroundColor = .blueOpacity
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(showInfoButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    lazy private var firstNameField: UIView = {
        let view = UITextFieldAnimateView()
        view.setupTextField(placeholder: "Имя")
        view.height = 70
        view.backgroundColor = .backgroundColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy private var lastNameField: UIView = {
        let view = UITextFieldAnimateView()
        view.setupTextField(placeholder: "Фамилия")
        view.height = 70
        view.backgroundColor = .backgroundColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy private var dateOfBirthField: UIView = {
        let view = UITextFieldAnimateView()
        view.setupTextField(placeholder: "Дата рождения")
        view.height = 70
        view.backgroundColor = .backgroundColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy private var citizenshipField: UIView = {
        let view = UITextFieldAnimateView()
        view.setupTextField(placeholder: "Гражданство")
        view.height = 70
        view.backgroundColor = .backgroundColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy private var passNumberField: UIView = {
        let view = UITextFieldAnimateView()
        view.setupTextField(placeholder: "Номер загранпаспорта")
        view.height = 70
        view.backgroundColor = .backgroundColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy private var passVaildDateField: UIView = {
        let view = UITextFieldAnimateView()
        view.setupTextField(placeholder: "Срок действия загранпаспорта")
        view.height = 70
        view.backgroundColor = .backgroundColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.backgroundColor = .white
        self.addSubview(titleLabel)
        self.addSubview(showInfoButton)
        self.addSubview(stackView)
        stackView.addArrangedSubview(firstNameField)
        stackView.addArrangedSubview(lastNameField)
        stackView.addArrangedSubview(dateOfBirthField)
        stackView.addArrangedSubview(citizenshipField)
        stackView.addArrangedSubview(passNumberField)
        stackView.addArrangedSubview(passVaildDateField)
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).inset(16)
            make.top.equalTo(self.snp.top).inset(16)
        }
        
        showInfoButton.snp.makeConstraints { make in
            make.height.width.equalTo(32)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-16)
            make.right.equalTo(self.snp.right).inset(16)
            make.left.equalTo(self.snp.left).inset(16)
        }
        
        self.snp.makeConstraints { make in
            make.height.equalTo(430)
        }
    }
    
    func setupData(title: String) {
        self.titleLabel.text = title
    }
    
    private func updateViewHeight() {
        UIView.animate(withDuration: 0.3) {
            self.snp.updateConstraints { make in
                make.height.equalTo(self.isHiddenStackView ? 430 : 58)
            }
            self.superview?.layoutIfNeeded()
        }
    }
    
    @objc func showInfoButtonAction() {
        showInfoButton.isSelected.toggle()
        isHiddenStackView = !showInfoButton.isSelected
        if showInfoButton.isSelected {
            self.stackView.isHidden = true
            showInfoButton.setImage(UIImage(named: "chevron_down_icon"), for: .normal)
            
        } else {
            self.stackView.isHidden = false
            showInfoButton.setImage(UIImage(named: "chevron_up_icon"), for: .normal)
        }
    }
}
