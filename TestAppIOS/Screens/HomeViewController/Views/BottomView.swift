//
//  BottomView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 17.12.23.
//

import Foundation
import UIKit

protocol OptionViewDelegate: HomeViewController {
    func amenitiesButtonTapped(sender: UIButton)
    func includedButtonTapped(sender: UIButton)
    func notIncludedButtonTapped(sender: UIButton)
}

class BottomView: UIView {
    
    weak var delegate: OptionViewDelegate?
    private var amenitiesView = OptionView(viewType: .amenities)
    private var includedView = OptionView(viewType: .included)
    private var notIncludedView = OptionView(viewType: .notIncluded)
    
    lazy private var aboutTheHotel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = .sfProDispalyMedium(size: 22)
        label.text = "Об отеле"
        return label
    }()
    
    lazy private var lineInfoLabel: UILabel = {
        let label = PaddingLabel(top: 5, bottom: 5, left: 10, right: 10)
        label.backgroundColor = .textLigthGray
        label.textColor = .textColorGray
        label.font = .sfProDispalyMedium(size: 16)
        return label
    }()
    
    lazy private var wifiInfoLabel: UILabel = {
        let label = PaddingLabel(top: 5, bottom: 5, left: 10, right: 10)
        label.backgroundColor = .textLigthGray
        label.textColor = .textColorGray
        label.font = .sfProDispalyMedium(size: 16)
        return label
    }()
    
    lazy private var distanceToAirportLabel: UILabel = {
        let label = PaddingLabel(top: 5, bottom: 5, left: 10, right: 10)
        label.backgroundColor = .textLigthGray
        label.textColor = .textColorGray
        label.font = .sfProDispalyMedium(size: 16)
        return label
    }()
    
    lazy private var distanceToTheBeachLabel: UILabel = {
        let label = PaddingLabel(top: 5, bottom: 5, left: 10, right: 10)
        label.backgroundColor = .textLigthGray
        label.textColor = .textColorGray
        label.font = .sfProDispalyMedium(size: 16)
        return label
    }()
    
    lazy private var hotelInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .textLigthGray
        view.layer.cornerRadius = 15
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        amenitiesView.optionButtonTapped = buttonTapped(sender:_:)
        includedView.optionButtonTapped = buttonTapped(sender:_:)
        notIncludedView.optionButtonTapped = buttonTapped(sender:_:)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     private func setupUI() {
         
        self.layer.cornerRadius = 12
        self.backgroundColor = .white
        self.addSubview(aboutTheHotel)
        self.addSubview(lineInfoLabel)
        self.addSubview(wifiInfoLabel)
        self.addSubview(distanceToAirportLabel)
        self.addSubview(distanceToTheBeachLabel)
        self.addSubview(hotelInfoLabel)
        self.addSubview(containerView)
        
        let dividerTop = DividerView()
        let dividerBottom = DividerView()
        self.addSubview(dividerTop)
        self.addSubview(dividerBottom)
        
      
        containerView.addSubview(amenitiesView)
        containerView.addSubview(includedView)
        containerView.addSubview(notIncludedView)
        
        aboutTheHotel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(16)
            make.left.equalTo(self.snp.left).inset(16)
        }
        
        lineInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutTheHotel.snp.bottom).inset(-16)
            make.left.equalTo(aboutTheHotel.snp.left)
        }
        
        wifiInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(lineInfoLabel.snp.centerY)
            make.left.equalTo(lineInfoLabel.snp.right).inset(-8)
        }
        
        distanceToAirportLabel.snp.makeConstraints { make in
            make.top.equalTo(lineInfoLabel.snp.bottom).inset(-8)
            make.left.equalTo(lineInfoLabel.snp.left)
        }
        
        distanceToTheBeachLabel.snp.makeConstraints { make in
            make.centerY.equalTo(distanceToAirportLabel.snp.centerY)
            make.left.equalTo(distanceToAirportLabel.snp.right).inset(-8)
        }
        
        hotelInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(distanceToAirportLabel.snp.bottom).inset(-12)
            make.left.equalTo(self.snp.left).inset(16)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        containerView.snp.makeConstraints { make in
            make.height.equalTo(184)
            make.top.equalTo(hotelInfoLabel.snp.bottom).inset(-18)
            make.left.equalTo(self.snp.left).inset(16)
            make.right.equalTo(self.snp.right).inset(16)
            make.bottom.equalTo(self.snp.bottom).inset(16)
        }
        
        amenitiesView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).inset(5)
            make.left.equalTo(containerView.snp.left).inset(15)
            make.right.equalTo(containerView.snp.right).offset(-15)
            make.height.equalTo(58)
        }
        
        dividerTop.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(amenitiesView.snp.bottom)
            make.right.equalTo(amenitiesView.snp.right)
            make.left.equalTo(amenitiesView.snp.left).inset(36)
        }
        
        dividerBottom.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(includedView.snp.bottom)
            make.right.equalTo(includedView.snp.right)
            make.left.equalTo(includedView.snp.left).inset(36)
        }
        
        includedView.snp.makeConstraints { make in
            make.top.equalTo(amenitiesView.snp.bottom)
            make.left.equalTo(containerView.snp.left).inset(15)
            make.right.equalTo(containerView.snp.right).inset(15)
            make.height.equalTo(58)
        }
        
        notIncludedView.snp.makeConstraints { make in
            make.top.equalTo(includedView.snp.bottom)
            make.left.equalTo(containerView.snp.left).inset(15)
            make.right.equalTo(containerView.snp.right).inset(15)
            make.height.equalTo(58)
        }
    }
    
    func setupData(model: [HotelModel]){
        for hotel in model {
            self.lineInfoLabel.text = hotel.lineInfo
            self.wifiInfoLabel.text = hotel.wifiInfo
            self.distanceToAirportLabel.text = hotel.distanceToAirport
            self.distanceToTheBeachLabel.text = hotel.distanceToTheBeach
            self.hotelInfoLabel.text = hotel.hotelInfo
        }
    }
    
    private func buttonTapped(sender: UIButton, _ type: ViewType) {
        switch type {
            
        case .amenities:
            delegate?.amenitiesButtonTapped(sender: sender)
        case .included:
            delegate?.includedButtonTapped(sender: sender)
        case .notIncluded:
            delegate?.notIncludedButtonTapped(sender: sender)
        }
    }
}
