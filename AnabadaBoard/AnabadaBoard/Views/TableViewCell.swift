//
//  TableViewCell.swift
//  AnabadaBoard
//
//  Created by 한수빈 on 5/21/24.
//

import UIKit

final class TableViewCell: UITableViewCell {

    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let goodsNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
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
        button.addTarget(nil, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 8
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
        
        // 셀 오토레이아웃 일반적으로 생성자에서 잡으면 됨 ⭐️⭐️⭐️
        setConstraints()
    }
    
    func setupStackView() {
        
        // self.addSubview보다 self.contentView.addSubview로 잡는게 더 정확함 ⭐️
        // (cell은 기본뷰로 contentView를 가지고 있기 때문)
        self.contentView.addSubview(mainImageView)
        //self.addSubview(mainImageView)
        
        // self.contentView.addSubview로 잡는게 더 정확함 ⭐️
        self.contentView.addSubview(stackView)
        //self.addSubview(stackView)
        
        // 스택뷰 위에 뷰들 올리기
        stackView.addArrangedSubview(goodsNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(likeButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        setMainImageViewConstraints()
        setGoodsNameLabelConstraints()
        setLikeButtonConstraints()
        setStackViewConstraints()
    }
    
    func setMainImageViewConstraints() {
        
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 100),
            mainImageView.widthAnchor.constraint(equalToConstant: 100),
            
            // self.leadingAnchor로 잡는 것보다 self.contentView.leadingAnchor로 잡는게 더 정확함 ⭐️
            // (cell은 기본뷰로 contentView를 가지고 있기 때문)
            mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    func setGoodsNameLabelConstraints() {
        goodsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goodsNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15),
            
            // self.trailingAnchor로 잡는 것보다 self.contentView.trailingAnchor로 잡는게 더 정확함 ⭐️
            // (cell은 기본뷰로 contentView를 가지고 있기 때문)
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }
    
    func setLikeButtonConstraints() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.heightAnchor.constraint(equalToConstant: 22),
            likeButton.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: 10)
        ])
    }
    
    @objc func likeButtonTapped() {
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
}
