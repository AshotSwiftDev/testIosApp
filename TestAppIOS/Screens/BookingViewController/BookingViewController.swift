//
//  BookingViewController.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 22.12.23.
//

import UIKit
import SnapKit

class BookingViewController: UIViewController {
    
    private var bookingModel = FetchBooking.shared.getBookingList()
    private var ratingView = RatingView()
    private var flightInformationView = FlightInformationView()
    private var buyerInformationView = BuyerInformationView()
    private var priceInfoView = PriceInfoView()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setupUI()
        setupData()
    }
    
    private func setupUI() {
        
        self.ratingView.layer.cornerRadius = 15
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.view.addSubview(payButtonBackgroundView)
        self.scrollView.addSubview(ratingView)
        self.scrollView.addSubview(flightInformationView)
        self.scrollView.addSubview(buyerInformationView)
        self.scrollView.addSubview(priceInfoView)
        self.scrollView.addSubview(addBayerButtonBackgroundView)
        self.addBayerButtonBackgroundView.addSubview(addBayerButton)
        self.addBayerButtonBackgroundView.addSubview(addBayerLabel)
        self.payButtonBackgroundView.addSubview(payButton)
        
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
        
        buyerInformationView.snp.makeConstraints { make in
            make.top.equalTo(flightInformationView.snp.bottom).inset(-8)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        
        addBayerButtonBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(buyerInformationView.snp.bottom).inset(-8)
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
            make.top.equalTo(scrollView.snp.bottom)
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
    
    private func setupData() {
        addBayerLabel.text = "Добавить туриста"
        ratingView.setupData(rating: "5 Превосходно", name: "Steigenberger Makadi", description: "Madinat Makadi, Safaga Road, Makadi Bay, Египет")
        flightInformationView.setupData(model: bookingModel)
        priceInfoView.setupData(model: bookingModel)
        registerKeyboardNotification()
        buyerInformationView.setupData(title: "Первый турист")
        
        self.payButton.setTitle("Оплатить \(bookingModel.tourInfo)", for: .normal)
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
        print("addBayer")
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

extension BookingViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: buyerInformationView.frame.origin.y - scrollView.contentInset.top), animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        scrollView.setContentOffset(CGPoint(x: 0, y: -scrollView.contentInset.top), animated: true)
    }
}
