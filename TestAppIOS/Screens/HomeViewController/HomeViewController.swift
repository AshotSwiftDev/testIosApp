//
//  ViewController.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 16.12.23.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let hotel = FetchHotel.shared.getHotels()
    private var topView = TopView()
    private var bottomView = BottomView()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .backgroundColor
        return scrollView
    }()
    
    lazy private var selectButtonBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy private var selectButton: UIButton = {
        var button = UIButton()
        button.titleLabel?.font = .sfProDispalyMedium(size: 16)
        button.setTitle("К выбору номера", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .textBlue
        button.addTarget(self, action: #selector(selectAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.delegate = self
        setupUI()
        setNavigationBar()
    }
    
    private func setupUI() {
        
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(topView)
        self.scrollView.addSubview(bottomView)
        self.view.addSubview(selectButtonBackgroundView)
        self.selectButtonBackgroundView.addSubview(selectButton)
        
        scrollView.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
        }
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).inset(-8)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(scrollView.snp.bottom).inset(12)
        }
        
        selectButtonBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom)
            make.width.equalTo(view.snp.width)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        selectButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.top.equalTo(selectButtonBackgroundView.snp.top).inset(12)
            make.left.equalTo(selectButtonBackgroundView.snp.left).inset(16)
            make.right.equalTo(selectButtonBackgroundView.snp.right).inset(16)
            make.bottom.equalTo(selectButtonBackgroundView.snp.bottom).inset(28)
        }
        
        topView.setupData(model: hotel)
        bottomView.setupData(model: hotel)
    }
    
    @objc private func selectAction() {
        
        if let firstHotel = FetchHotel.shared.getHotels().first,
           let roomInfo = FetchHotel.shared.getRoomInfo(forHotel: firstHotel) {
            // Передайте roomInfo в RoomViewController
            let roomViewController = SelectRoomViewController()
            roomViewController.rooms = roomInfo
            navigationController?.pushViewController(roomViewController, animated: true)
        }
    }
    
   private func setNavigationBar() {
        self.navigationItem.title = "Отель"

        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.tintColor = .black
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                 NSAttributedString.Key.font: UIFont.sfProDispalyMedium(size: 18)]
        }
    }
}

extension HomeViewController: OptionViewDelegate {
    func amenitiesButtonTapped(sender: UIButton) {
        print("amenitiesButtonTapped")
    }
    
    func includedButtonTapped(sender: UIButton) {
        print("includedButtonTapped")
    }
    
    func notIncludedButtonTapped(sender: UIButton) {
        print("notIncludedButtonTapped")
    }
}
