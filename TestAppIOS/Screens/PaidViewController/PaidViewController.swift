//
//  PaidViewController.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 23.12.23.
//

import UIKit

class PaidViewController: UIViewController {
    
    //MARK: - Properties
    lazy private var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .sfProDispalyMedium(size: 22)
        return label
    }()
    
    lazy private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var superButton: UIButton = {
        var button = UIButton()
        button.setTitle("Супер!", for: .normal)
        button.titleLabel?.font = .sfProDispalyMedium(size: 16)
        button.layer.cornerRadius = 15
        button.backgroundColor = .textBlue
        button.addTarget(self, action: #selector(superAction), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
        setNavigationBar()
    }
    
    //MARK: - Setup
    private func setupUI() {
        
        self.view.backgroundColor = .white
        self.view.addSubview(imageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(superButton)
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(122)
            make.centerX.equalTo(view.snp.centerX)
            make.height.width.equalTo(94)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).inset(-32)
            make.centerX.equalTo(imageView.snp.centerX)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-20)
            make.left.equalTo(view.snp.left).inset(23)
            make.right.equalTo(view.snp.right).inset(23)
        }
        
        superButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).inset(28)
            make.left.equalTo(view.snp.left).inset(16)
            make.right.equalTo(view.snp.right).inset(16)
            make.height.equalTo(48)
        }
    }
    
    //MARK: - Configurations
    private func setupData() {
        
        self.imageView.image = UIImage(named: "party_popper_icon")
        titleLabel.text = "Ваш заказ принят в работу"
        descriptionLabel.text = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
    }
    
    private func setNavigationBar() {
        self.navigationItem.title = "Заказ оплачен"
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "chevron_left_icon"), for: .normal)
        backButton.clipsToBounds = true
        backButton.bounds.size = .init(width: 32, height: 32)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.tintColor = .black
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                 NSAttributedString.Key.font: UIFont.sfProDispalyMedium(size: 18)]
        }
    }
    
    //MARK: - Actions
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func superAction() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
