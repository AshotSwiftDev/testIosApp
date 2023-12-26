//
//  RoomView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 21.12.23.
//

import UIKit

class RoomCell: UITableViewCell {
    
    var isSelectedCell: (() -> Void)?
    var moreButtonSend: (() -> Void)?
    
    static var identifier = "RoomView"
    private var cellBackgroundView = UIView()
    
    lazy private var roomImage: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy private var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .sfProDispalyMedium(size: 22)
        return label
    }()
    
    lazy private var allInclusiveLabel: UILabel = {
        let label = PaddingLabel(top: 5, bottom: 5, left: 10, right: 10)
        label.backgroundColor = .textLigthGray
        label.textColor = .textColorGray
        label.font = .sfProDispalyMedium(size: 16)
        return label
    }()
    
    lazy private var optionsLabel: UILabel = {
        let label = PaddingLabel(top: 5, bottom: 5, left: 10, right: 10)
        label.backgroundColor = .textLigthGray
        label.textColor = .textColorGray
        label.font = .sfProDispalyMedium(size: 16)
        return label
    }()
    
    lazy private var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .sfProDispalySemibold(size: 30)
        return label
    }()
    
    lazy private var conditionsLabel : UILabel = {
        let label = UILabel()
        label.textColor = .textColorGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var moreButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blueOpacity
        button.titleLabel?.font = .sfProDispalyMedium(size: 16)
        button.setTitleColor(.textBlue, for: .normal)
        button.setTitle("Подробнее о номере", for: .normal)
        button.setImage(UIImage(named: "chevron_button_right_icon"), for: .normal)
        button.imagePosition(position: .right, spacing: 12)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(moreButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy private var selectButton: UIButton = {
        var button = UIButton()
        button.titleLabel?.font = .sfProDispalyMedium(size: 16)
        button.setTitle("Выбрать номер", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .textBlue
        button.addTarget(self, action: #selector(selectAction), for: .touchUpInside)
        return button
    }()
    
    lazy private var indicatorView = StateIndicatorView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        let clearView = UIView()
        clearView.backgroundColor = .clear
        self.selectedBackgroundView = clearView
        self.contentView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.cellBackgroundView.backgroundColor = .white
        self.cellBackgroundView.layer.cornerRadius = 12
        self.backgroundColor = .clear
        self.addSubview(cellBackgroundView)
        self.addSubview(roomImage)
        self.addSubview(indicatorView)
        self.addSubview(typeLabel)
        self.addSubview(allInclusiveLabel)
        self.addSubview(optionsLabel)
        self.addSubview(moreButton)
        self.addSubview(priceLabel)
        self.addSubview(conditionsLabel)
        self.addSubview(selectButton)
        
        cellBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom).inset(8)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
        
        roomImage.snp.makeConstraints { make in
            make.top.equalTo(cellBackgroundView.snp.top).inset(16)
            make.left.equalTo(cellBackgroundView.snp.left).inset(16)
            make.right.equalTo(cellBackgroundView.snp.right).inset(16)
        }
        
        indicatorView.snp.makeConstraints { make in
            make.bottom.equalTo(roomImage.snp.bottom).inset(8)
            make.centerX.equalTo(roomImage.snp.centerX)
            make.width.equalTo(75)
            make.height.equalTo(17)
        }
        
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(roomImage.snp.bottom).inset(-8)
            make.left.equalTo(roomImage.snp.left)
            make.right.equalTo(roomImage.snp.right)
            
        }
        
        allInclusiveLabel.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom).inset(-8)
            make.left.equalTo(typeLabel.snp.left)
        }
        
        optionsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(allInclusiveLabel.snp.centerY)
            make.left.equalTo(allInclusiveLabel.snp.right).inset(-8)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalTo(allInclusiveLabel.snp.bottom).inset(-8)
            make.left.equalTo(allInclusiveLabel.snp.left)
            make.height.equalTo(29)
            make.width.equalTo(192)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(moreButton.snp.bottom).inset(-12)
            make.left.equalTo(moreButton.snp.left)
        }
        
        conditionsLabel.snp.makeConstraints { make in
            make.bottom.equalTo(priceLabel.snp.bottom)
            make.left.equalTo(priceLabel.snp.right).inset(-8)
        }
        
        selectButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalTo(priceLabel.snp.bottom).inset(-12)
            make.left.equalTo(cellBackgroundView.snp.left).inset(16)
            make.right.equalTo(cellBackgroundView.snp.right).inset(16)
            make.bottom.equalTo(cellBackgroundView.snp.bottom).inset(16)
        }
    }
    
    func setupData(model: RoomlModel){
        self.roomImage.image = UIImage(named: model.image)
        self.typeLabel.text = model.type
        self.allInclusiveLabel.text = model.allInclusive
        self.optionsLabel.text = model.option
        self.priceLabel.text = "от \(model.price) ₽"
        self.conditionsLabel.text = model.conditions
    }
    
    @objc private func selectAction() {
        isSelectedCell?()
    }
    
    @objc private func moreButtonAction() {
        moreButtonSend?()
    }
}
