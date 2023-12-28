//
//  BookingViewController.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 22.12.23.
//

import UIKit
import SnapKit

class BookingViewController: UIViewController {
    
    //MARK: - Properties
    private let tourists = ["Первый турист", "Второй турист", "Третый турист", "Четвертый турист", "Пятый турист", "Шестой турист", "Седьмой турист", "Восьмой турист", "Девятый турист", "Десятый турист"]
    private var booking: BookingModel?
    private var index = 0
    private var ratingView = RatingView()
    private var flightInformationView = FlightInformationView()
    private var sectionView = SectionView()
    private var priceInfoView = PriceInfoView()
    private var buyerInfoView = BuyerInfoView()
    private var scrollViewBottomConstraint: Constraint?
    
    lazy private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .backgroundColor
        return scrollView
    }()
    
    lazy private var payButtonBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy private var payButton: UIButton = {
        var button = UIButton()
        button.titleLabel?.font = .sfProDispalyMedium(size: 16)
        button.layer.cornerRadius = 15
        button.backgroundColor = .textBlue
        button.addTarget(self, action: #selector(payAction), for: .touchUpInside)
        return button
    }()
    
    lazy private var addBayerButtonBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy private var addBayerLabel: UILabel = {
        let label = UILabel()
        label.font = .sfProDispalyMedium(size: 22)
        label.textColor = .black
        return label
    }()
    
    lazy private var addBayerButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "plus_icon"), for: .normal)
        button.layer.cornerRadius = 6
        button.backgroundColor = .textColorBlue
        button.addTarget(self, action: #selector(addBayerAction), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setupUI()
        setupData()
    }
    
    func getBooking() {
        NetworkService.shared.getBooking { bookingResponce in
            self.booking = bookingResponce
        } failureBlock: { error in
            print(error)
        }
    }
    
    //MARK: - Setup
    private func setupUI() {
        
        self.ratingView.layer.cornerRadius = 15
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.view.addSubview(payButtonBackgroundView)
        self.scrollView.addSubview(ratingView)
        self.scrollView.addSubview(flightInformationView)
        self.scrollView.addSubview(buyerInfoView)
        self.scrollView.addSubview(stackView)
        self.scrollView.addSubview(priceInfoView)
        self.scrollView.addSubview(addBayerButtonBackgroundView)
        self.addBayerButtonBackgroundView.addSubview(addBayerButton)
        self.addBayerButtonBackgroundView.addSubview(addBayerLabel)
        self.payButtonBackgroundView.addSubview(payButton)
        stackView.addArrangedSubview(sectionView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            scrollViewBottomConstraint = make.bottom.equalTo(payButtonBackgroundView.snp.top).constraint
        }
        
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top).inset(8)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        
        flightInformationView.snp.makeConstraints { make in
            make.top.equalTo(ratingView.snp.bottom).inset(-8)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        
        buyerInfoView.snp.makeConstraints { make in
            make.top.equalTo(flightInformationView.snp.bottom).inset(-8)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(buyerInfoView.snp.bottom).inset(-8)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        
        addBayerButtonBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).inset(-8)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.height.equalTo(58)
        }
        
        addBayerLabel.snp.makeConstraints { make in
            make.centerY.equalTo(addBayerButtonBackgroundView.snp.centerY)
            make.left.equalTo(addBayerButtonBackgroundView.snp.left).inset(16)
        }
        
        addBayerButton.snp.makeConstraints { make in
            make.centerY.equalTo(addBayerButtonBackgroundView.snp.centerY).inset(-13)
            make.right.equalTo(addBayerButtonBackgroundView.snp.right).inset(16)
            make.height.width.equalTo(32)
        }
        
        priceInfoView.snp.makeConstraints { make in
            make.top.equalTo(addBayerButtonBackgroundView.snp.bottom).inset(-8)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
        
        payButtonBackgroundView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        payButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalTo(payButtonBackgroundView.snp.top).inset(12)
            make.left.equalTo(payButtonBackgroundView.snp.left).inset(16)
            make.right.equalTo(payButtonBackgroundView.snp.right).inset(16)
            make.bottom.equalTo(payButtonBackgroundView.snp.bottom).inset(28)
        }
    }
    
    // MARK: - Configrurations
    private func setupData() {
        
        NetworkService.shared.getBooking{ responseHotel in
            self.booking = responseHotel
            guard let booking = self.booking else { return }
            DispatchQueue.main.async {
                self.addBayerLabel.text = "Добавить туриста"
                
                self.ratingView.setupData(rating: "\(booking.horating)", ratingName: booking.ratingName, name: booking.hotelName, hotelAdress: booking.hotelAdress)
                self.flightInformationView.setupData(model: booking)
                self.priceInfoView.setupData(model: booking)
                self.registerKeyboardNotification()
                self.sectionView.setupData(title: "Первый турист")
                let toPay = booking.tourPrice + booking.fuelCharge + booking.serviceCharge
                let toPayPrice = toPay.formattedWithSpaces()
                self.payButton.setTitle("Оплатить \(toPayPrice) ₽", for: .normal)
            }
        } failureBlock: { error in
            print(error.localizedDescription)
        }
    }
    
    private func setNavigationBar() {
        self.navigationItem.title = "Бронирование"
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
    
    // MARK: - Actions
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func payAction() {
        let vc = PaidViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func addBayerAction() {
        
        self.index += 1
        if index < tourists.count {
            let sectionView = SectionView()
            sectionView.setupData(title: tourists[self.index])
            self.stackView.addArrangedSubview(sectionView)
        }
        if index == tourists.endIndex - 1 {
            self.addBayerButton.isEnabled = true
            self.addBayerButton.backgroundColor = .buttonBackground
        }
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let rect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let kbHeight = rect.height
        let payButtonBackgroundViewHeight = CGFloat(self.payButtonBackgroundView.bounds.height)
        scrollViewBottomConstraint?.update(offset: -kbHeight + payButtonBackgroundViewHeight)
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        scrollViewBottomConstraint?.update(offset: 0)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - Extansions
extension BookingViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: stackView.frame.origin.y - scrollView.contentInset.top), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: -scrollView.contentInset.top), animated: true)
    }
}
