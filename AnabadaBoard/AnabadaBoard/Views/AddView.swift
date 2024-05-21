//
//  AddView.swift
//  AnabadaBoard
//
//  Created by 한수빈 on 5/21/24.
//

import UIKit

class AddView: UIView {

    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let goodsNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.boldSystemFont(ofSize: 22)
        return textField
    }()

    let descriptionTextField: UITextField = {
        let label = UITextField()
        label.font = UIFont.systemFont(ofSize: 17)
        return label
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
        stackView.addArrangedSubview(goodsNameTextField)
        stackView.addArrangedSubview(descriptionTextField)
        
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
        setGoodsNameTextFieldConstraints()
        setDescriptionTextFieldConstraints()
        setStackViewConstraints()
    }
    
    func setMainImageViewConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 240),
            mainImageView.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    func setGoodsNameTextFieldConstraints() {
        goodsNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goodsNameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setDescriptionTextFieldConstraints() {
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionTextField.heightAnchor.constraint(equalToConstant: 100)
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
