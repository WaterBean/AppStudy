//
//  DetailView.swift
//  AnabadaBoard
//
//  Created by 한수빈 on 5/21/24.
//

import UIKit

final class DetailView: UIView {

    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let goodsNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .blue
        return button
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 15
        return sv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        // 스택뷰 위에 뷰들 올리기
        stackView.addArrangedSubview(mainImageView)
        stackView.addArrangedSubview(goodsNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(likeButton)
        
        // 뷰컨트롤러의 기본뷰 위에 스택뷰 올리기
        self.addSubview(stackView)
    }
    
    // 오토레이아웃 업데이트
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func setConstraints() {
        setMainImageViewConstraints()
        setGoodsNameLabelConstraints()
        setDescriptionLabelConstraints()
        setLikeButtonConstraints()
        setStackViewConstraints()
    }
    
    
    func setMainImageViewConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 240),
            mainImageView.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    func setGoodsNameLabelConstraints() {
        goodsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goodsNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    func setLikeButtonConstraints() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
    }
}
