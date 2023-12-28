//
//  FlightInformationView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 22.12.23.
//

import UIKit

class FlightInformationView: UIView {
    
    // MARK: - Properties
    lazy private var departureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var departureInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var arrivalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var arrivalInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var tourDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var tourDateInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var numberOfNightsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var numberOfNightsInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var hotelNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var hotelNameInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var roomLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var roomInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var nutritionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var nutritionInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .sfProDispalyRegular(size: 16)
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
        self.layer.cornerRadius = 15
        
        self.addSubview(departureLabel)
        self.addSubview(departureInfoLabel)
        self.addSubview(arrivalLabel)
        self.addSubview(arrivalInfoLabel)
        self.addSubview(tourDateLabel)
        self.addSubview(tourDateInfoLabel)
        self.addSubview(numberOfNightsLabel)
        self.addSubview(numberOfNightsInfoLabel)
        self.addSubview(hotelNameLabel)
        self.addSubview(hotelNameInfoLabel)
        self.addSubview(roomLabel)
        self.addSubview(roomInfoLabel)
        self.addSubview(nutritionLabel)
        self.addSubview(nutritionInfoLabel)
        
        departureLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(16)
            make.left.equalTo(self.snp.left).inset(16)
        }
        
        departureInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(departureLabel.snp.top)
            make.left.equalTo(self.snp.left).inset(156)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        arrivalLabel.snp.makeConstraints { make in
            make.top.equalTo(departureInfoLabel.snp.bottom).inset(-16)
            make.left.equalTo(departureLabel.snp.left)
        }
        
        arrivalInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(arrivalLabel.snp.top)
            make.left.equalTo(self.snp.left).inset(156)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        tourDateLabel.snp.makeConstraints { make in
            make.top.equalTo(arrivalInfoLabel.snp.bottom).inset(-16)
            make.left.equalTo(arrivalLabel.snp.left)
        }
        
        tourDateInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(tourDateLabel.snp.top)
            make.left.equalTo(self.snp.left).inset(156)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        numberOfNightsLabel.snp.makeConstraints { make in
            make.top.equalTo(tourDateInfoLabel.snp.bottom).inset(-16)
            make.left.equalTo(tourDateLabel.snp.left)
        }
        
        numberOfNightsInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(numberOfNightsLabel.snp.top)
            make.left.equalTo(self.snp.left).inset(156)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        hotelNameLabel.snp.makeConstraints { make in
            make.top.equalTo(numberOfNightsInfoLabel.snp.bottom).inset(-16)
            make.left.equalTo(numberOfNightsLabel.snp.left)
        }
        
        hotelNameInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(hotelNameLabel.snp.top)
            make.left.equalTo(self.snp.left).inset(156)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        roomLabel.snp.makeConstraints { make in
            make.top.equalTo(hotelNameInfoLabel.snp.bottom).inset(-16)
            make.left.equalTo(hotelNameLabel.snp.left)
        }
        
        roomInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(roomLabel.snp.top)
            make.left.equalTo(self.snp.left).inset(156)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        nutritionLabel.snp.makeConstraints { make in
            make.top.equalTo(roomInfoLabel.snp.bottom).inset(-16)
            make.left.equalTo(roomLabel.snp.left)
            make.bottom.equalTo(self.snp.bottom).inset(16)
        }
        
        nutritionInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(nutritionLabel.snp.top)
            make.left.equalTo(self.snp.left).inset(156)
            make.right.equalTo(self.snp.right).inset(16)
        }
    }
    
    //MARK: - Configurations
    func setupData(model: BookingModel) {
        DispatchQueue.main.async {
            self.departureLabel.text = "Вылет из"
            self.departureInfoLabel.text = model.departure
            self.arrivalLabel.text = "Страна, город"
            self.arrivalInfoLabel.text = model.arrivalCountry
            self.tourDateLabel.text = "Даты"
            self.tourDateInfoLabel.text = "\( model.tourDateStart) - \( model.tourDateStop)"
            self.numberOfNightsLabel.text = "Кол-во ночей"
            self.numberOfNightsInfoLabel.text = "\(model.numberOfNights)"
            self.hotelNameLabel.text = "Отель"
            self.hotelNameInfoLabel.text = model.hotelName
            self.roomLabel.text = "Номер"
            self.roomInfoLabel.text = model.room
            self.nutritionLabel.text = "Питание"
            self.nutritionInfoLabel.text = model.nutrition
        }
    }
}
