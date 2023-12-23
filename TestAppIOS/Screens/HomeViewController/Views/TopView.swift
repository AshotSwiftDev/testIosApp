//
//  TopView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 17.12.23.
//

import UIKit

class TopView: UIView {
    
    private var ratingView = RatingView()
    private var indicatorView = StateIndicatorView()
    
    lazy private var hotelImage: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy private var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .sfProDispalySemibold(size: 30)
        return label
    }()
    
    lazy private var conditionsLabel : UILabel = {
        let label = UILabel()
        label.textColor = .textColorGray
        label.numberOfLines = 2
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var starImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
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
        self.layer.cornerRadius = 12
        self.addSubview(hotelImage)
        self.addSubview(indicatorView)
        self.addSubview(ratingView)
        self.addSubview(priceLabel)
        self.addSubview(conditionsLabel)
        
        hotelImage.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left).inset(16)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        indicatorView.snp.makeConstraints { make in
            make.bottom.equalTo(hotelImage.snp.bottom).inset(8)
            make.centerX.equalTo(hotelImage.snp.centerX)
            make.width.equalTo(75)
            make.height.equalTo(17)
        }
        
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(hotelImage.snp.bottom)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(ratingView.snp.bottom)
            make.left.equalTo(self.snp.left).inset(16)
            make.bottom.equalTo(self.snp.bottom).inset(16)
        }
        
        conditionsLabel.snp.makeConstraints { make in
            make.left.equalTo(priceLabel.snp.right).inset(-8)
            make.bottom.equalTo(priceLabel.snp.bottom)
        }
    }
    
    func setupData(model: [HotelModel]){
        for hotel in model {
            self.hotelImage.image = UIImage(named: hotel.image)
            self.priceLabel.text = "от \(hotel.price) ₽"
            self.conditionsLabel.text = hotel.conditions
            self.ratingView.setupData(rating: hotel.rating, name: hotel.name, description: hotel.description)
        }
    }
}
