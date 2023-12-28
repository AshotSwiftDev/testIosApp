//
//  SelectRoomViewController.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 20.12.23.
//

import UIKit

class SelectRoomViewController: UIViewController {
    
    //MARK: - Properties
    private var rooms: [Room]?
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .backgroundColor
        return tableView
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getRooms()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RoomCell.self, forCellReuseIdentifier: RoomCell.identifier)
        setupUI()
        setNavigationBar()
    }
    
    func getRooms() {
        NetworkService.shared.getRooms { [weak self] responseRoom in
            guard let self = self else { return }
            
            // Perform UI-related tasks on the main thread
            DispatchQueue.main.async {
                self.rooms = responseRoom.rooms
                self.tableView.reloadData()
            }
        } failureBlock: { error in
            print(error.localizedDescription)
        }
    }
    
    //MARK: - Setup
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
    
    //MARK: - Configurations
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
    
    //MARK: - Actions
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Extansions
extension SelectRoomViewController: UITableViewDelegate {
    
}

extension SelectRoomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rooms = self.rooms else { return 0 }
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomCell.identifier, for: indexPath) as? RoomCell
        
        if let rooms = rooms {
            
            cell?.setupData(model: rooms[indexPath.row])
            cell?.isSelectedCell = { [weak self] in
                
                let bookingViewController = BookingViewController()
                self?.navigationController?.pushViewController(bookingViewController, animated: true)
            }
            
            cell?.moreButtonSend = {
                print("moreButtonAction")
            }
        }
        return cell ?? UITableViewCell()
    }
}
