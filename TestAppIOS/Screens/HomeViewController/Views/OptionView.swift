//
//  OptionView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 20.12.23.
//

import UIKit

enum ViewType {
    
    case amenities
    case included
    case notIncluded
    
    var title: String {
        switch self {
        case .amenities:
            return "Удобства"
        case .included:
            return "Что включено"
        case .notIncluded:
            return "Что не включено"
        }
    }
    
    var description: String {
        switch self {
        case .amenities:
            return "Самое необходимое"
        case .included:
            return "Самое необходимое"
        case .notIncluded:
            return "Самое необходимое"
        }
    }
    
    var image: UIImage {
        switch self{
        case .amenities:
            return UIImage(named: "smile_icon")!
        case .included:
            return UIImage(named: "check_mark_icon")!
        case .notIncluded:
            return UIImage(named: "x_mark_icon")!
        }
    }
    
    var chevronImage: UIImage {
        switch self{
        case .amenities:
            return UIImage(named: "chevron_rigth_icon")!
        case .included:
            return UIImage(named: "chevron_rigth_icon")!
        case .notIncluded:
            return UIImage(named: "chevron_rigth_icon")!
        }
    }
}

class OptionView: UIView {
    
   private var viewType: ViewType
   var optionButtonTapped:((_ sender: UIButton, _ type: ViewType) -> Void)?
    
    lazy private var catecoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy private var chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .textDark
        label.font = .sfProDispalyMedium(size: 16)
        return label
    }()
    
    lazy private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = .sfProDispalyMedium(size: 14)
        return label
    }()
    
    lazy var viewTappedButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    lazy private var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separatorColor
        return view
    }()
    
    init(viewType: ViewType) {
        self.viewType = viewType
        super.init(frame: .zero)
        self.clipsToBounds = true
        setupUI()
        
        viewTappedButton.addTarget(self, action: #selector(optionTypeButtonAction(_:)), for: .touchUpInside)
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        self.catecoryImageView.image = self.viewType.image
        self.titleLabel.text = self.viewType.title
        self.descriptionLabel.text = self.viewType.description
        self.chevronImageView.image = self.viewType.chevronImage
        
        self.addSubview(catecoryImageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(chevronImageView)
        self.addSubview(viewTappedButton)
        
        viewTappedButton.snp.makeConstraints { make in
            make.height.equalTo(self.snp.height)
            make.width.equalTo(self.snp.width)
            make.center.equalTo(self.snp.center)
        }
        
        catecoryImageView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).inset(0)
            make.centerY.equalTo(self.snp.centerY)
            make.height.width.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(10)
            make.left.equalTo(catecoryImageView.snp.right).inset(-12)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).inset(2)
        }
        
        chevronImageView.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right).inset(5)
            make.centerY.equalTo(self.snp.centerY)
            make.height.width.equalTo(12)
        }
    }
    
    @objc private func optionTypeButtonAction(_ sender: UIButton) {
        optionButtonTapped?(viewTappedButton, viewType)
    }
}
