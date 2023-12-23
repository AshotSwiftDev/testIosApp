//
//  RatingView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 22.12.23.
//

import UIKit

class RatingView: UIView {
    
    lazy private var ratingView: UIView = {
        let view = UIView()
        view.backgroundColor = .ratingBackground
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy private var ratingImage: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    lazy private var ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textYellow
        label.font = .sfProDispalyMedium(size: 16)
        return label
    }()
    
    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .sfProDispalyMedium(size: 22)
        return label
    }()
    
    lazy private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textBlue
        label.numberOfLines = 2
        label.font = .sfProDispalyMedium(size: 14)
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  setupUI() {
        self.backgroundColor = .white
        self.addSubview(ratingView)
        self.ratingView.addSubview(ratingImage)
        self.ratingView.addSubview(ratingLabel)
        self.addSubview(nameLabel)
        self.addSubview(descriptionLabel)
        
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(16)
            make.left.equalTo(self.snp.left).inset(16)
            make.height.equalTo(29)
            make.width.equalTo(149)
        }
        
        ratingImage.snp.makeConstraints { make in
            make.height.width.equalTo(15)
            make.centerY.equalTo(ratingView.snp.centerY)
            make.left.equalTo(ratingView.snp.left).inset(10)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(ratingImage.snp.centerY)
            make.left.equalTo(ratingImage.snp.right).inset(-2)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(ratingView.snp.bottom).inset(-8)
            make.left.equalTo(ratingView.snp.left)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(-8)
            make.left.equalTo(nameLabel.snp.left)
            make.bottom.equalTo(self.snp.bottom).inset(16)
        }
    }
    
    func setupData(rating: String, name: String, description: String) {
        self.ratingImage.image = UIImage(named: "rating_star_icon")
        self.ratingLabel.text = rating
        self.nameLabel.text = name
        self.descriptionLabel.text = description
    }
}
