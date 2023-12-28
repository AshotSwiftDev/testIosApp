//
//  TopView.swift
//  TestAppIOS
//
//  Created by Ashot Kirakosyan on 17.12.23.
//

import UIKit

class TopView: UIView {
    
    // MARK: - Properties
    private var images = [UIImage]()
    private var maxImages = 0
    private var imageIndex: NSInteger = 0
    
    private var ratingView = RatingView()
    private var indicatorView = StateIndicatorView()
    
    lazy private var hotelImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    lazy private var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .sfProDispalySemibold(size: 30)
        return label
    }()
    
    lazy private var priceForItLabel : UILabel = {
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
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setupUI()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped)) // put : at the end of method name
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.hotelImage.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped)) // put : at the end of method name
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.hotelImage.addGestureRecognizer(swipeLeft)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        self.addSubview(hotelImage)
        self.addSubview(indicatorView)
        self.addSubview(ratingView)
        self.addSubview(priceLabel)
        self.addSubview(priceForItLabel)
        
        hotelImage.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left).inset(16)
            make.right.equalTo(self.snp.right).inset(16)
            make.height.equalTo(257)
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
        
        priceForItLabel.snp.makeConstraints { make in
            make.left.equalTo(priceLabel.snp.right).inset(-8)
            make.bottom.equalTo(priceLabel.snp.bottom)
        }
    }
    
    // MARK: - Configurations
    func setupData(model: HotelModel) {
        
        for imageUrl in model.imageUrls {
            NetworkService.shared.getImage(imageURL: imageUrl) { response in
                guard let image = response else { return }
                self.images.append(image)
                self.maxImages = self.images.count - 1
                self.indicatorView.setupUI(circleCount: model.imageUrls.count)
                if let firstImage = self.images.first {
                    self.hotelImage.image = firstImage
                }
                if self.images.count <= 1 {
                    self.indicatorView.isHidden = true
                } else {
                    self.indicatorView.isHidden = false
                }
                
            } failureBlock: { error in
                print(error)
            }
        }
        let price = model.minimalPrice.formattedWithSpaces()
        self.priceLabel.text = "от \(price) ₽"
        self.priceForItLabel.text = model.priceForIt
        self.ratingView.setupData(rating: "\(model.rating)", ratingName: model.ratingName, name: model.name, hotelAdress: model.adress)
    }
    
    @objc func swiped(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                imageIndex -= 1
                if imageIndex < 0 {
                    imageIndex = maxImages
                }
                UIView.transition(with: self.hotelImage,
                                  duration: 0.3,
                                  options: .transitionCrossDissolve,
                                  animations: {
                    self.indicatorView.updateAccent(at: self.imageIndex)
                    self.hotelImage.image = self.images[self.imageIndex]
                },
                                  completion: nil)
            case UISwipeGestureRecognizer.Direction.left:
                imageIndex += 1
                if imageIndex > maxImages {
                    imageIndex = 0
                }
                
                UIView.transition(with: self.hotelImage,
                                  duration: 0.3,
                                  options: .transitionCrossDissolve,
                                  animations: {
                    self.indicatorView.updateAccent(at: self.imageIndex)
                    self.hotelImage.image = self.images[self.imageIndex]
                },
                                  completion: nil)
            default:
                break
            }
        }
    }
}
