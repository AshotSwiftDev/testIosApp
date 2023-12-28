//
//  PriceInfoView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 23.12.23.
//
import UIKit

class PriceInfoView: UIView {
    
    //MARK: - Properties
    lazy private var tourLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var tourInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var fuelSurchargeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var fuelSurchargeInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var serviceFeeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var serviceFeeInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var toPayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textGray
        label.font = .sfProDispalyRegular(size: 16)
        return label
    }()
    
    lazy private var toPayInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .textBlue
        label.font = .sfProDispalySemibold(size: 16)
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
        self.addSubview(tourLabel)
        self.addSubview(tourInfoLabel)
        self.addSubview(fuelSurchargeLabel)
        self.addSubview(fuelSurchargeInfoLabel)
        self.addSubview(serviceFeeLabel)
        self.addSubview(serviceFeeInfoLabel)
        self.addSubview(toPayLabel)
        self.addSubview(toPayInfoLabel)
        
        tourLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(16)
            make.left.equalTo(self.snp.left).inset(16)
        }
        
        tourInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(tourLabel.snp.top)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        fuelSurchargeLabel.snp.makeConstraints { make in
            make.top.equalTo(tourInfoLabel.snp.bottom).inset(-16)
            make.left.equalTo(tourLabel.snp.left)
        }
        
        fuelSurchargeInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(fuelSurchargeLabel.snp.top)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        serviceFeeLabel.snp.makeConstraints { make in
            make.top.equalTo(fuelSurchargeInfoLabel.snp.bottom).inset(-16)
            make.left.equalTo(fuelSurchargeLabel.snp.left)
        }
        
        serviceFeeInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(serviceFeeLabel.snp.top)
            make.right.equalTo(self.snp.right).inset(16)
        }
        
        toPayLabel.snp.makeConstraints { make in
            make.top.equalTo(serviceFeeInfoLabel.snp.bottom).inset(-16)
            make.left.equalTo(serviceFeeLabel.snp.left)
        }
        
        toPayInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(toPayLabel.snp.top)
            make.right.equalTo(self.snp.right).inset(16)
            make.bottom.equalTo(self.snp.bottom).inset(16)
        }
    }
    
    //MARK: - Configurations
    func setupData(model: BookingModel) {
        DispatchQueue.main.async {
            let tourPrice = model.tourPrice.formattedWithSpaces()
            let fuelCharge = model.fuelCharge.formattedWithSpaces()
            let serviceCharge = model.serviceCharge.formattedWithSpaces()
            let toPay = model.tourPrice + model.fuelCharge + model.serviceCharge
            let toPayPrice = toPay.formattedWithSpaces()
            self.tourLabel.text = "Тур"
            self.tourInfoLabel.text = "\(tourPrice) ₽"
            self.fuelSurchargeLabel.text = "Топливный сбор"
            self.fuelSurchargeInfoLabel.text = "\(fuelCharge) ₽"
            self.serviceFeeLabel.text = "Сервисный сбор"
            self.serviceFeeInfoLabel.text = "\(serviceCharge) ₽"
            self.toPayLabel.text = "К оплате"
            self.toPayInfoLabel.text = "\(toPayPrice) ₽"
        }
    }
}
