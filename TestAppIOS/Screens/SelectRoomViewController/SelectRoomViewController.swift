//
//  SelectRoomViewController.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 20.12.23.
//

import UIKit

class SelectRoomViewController: UIViewController {
    
    var rooms = [RoomlModel]()
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .backgroundColor
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RoomCell.self, forCellReuseIdentifier: RoomCell.identifier)
        setupUI()
        setNavigationBar()
    }
    
    private func setupUI() {
        
        view.backgroundColor = .white
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    func setNavigationBar() {
        self.navigationItem.title =   "Steigenberger Makadi"
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
}

extension SelectRoomViewController: UITableViewDelegate {
    
}

extension SelectRoomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomCell.identifier, for: indexPath) as? RoomCell
        let model = rooms[indexPath.item]
        cell?.setupData(model: model)
        cell?.isSelectedCell = { [weak self] in
            let bookingViewController = BookingViewController()
            self?.navigationController?.pushViewController(bookingViewController, animated: true)
        }
        return cell ?? UITableViewCell()
    }
}
