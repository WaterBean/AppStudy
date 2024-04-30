//
//  SuccessViewController.swift
//  SecondaryPassword
//
//  Created by 한수빈 on 4/30/24.
//

import UIKit

class SuccessViewController: UIViewController {

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "서비스 접속 성공"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        return label
    }()
    
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("버튼", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonTapped() {
        //만들기
        let alert = UIAlertController(title: "알림", message: "알림창입니다.", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼이 눌렸습니다.")
            self.statusLabel.text = "확인 버튼이 눌림"
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소버튼이 눌렸습니다.")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 실제 띄우기
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(button)
        view.addSubview(statusLabel)
        
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        statusLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 200).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
//        button.widthAnchor.constraint(equalToConstant: 70).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true

        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Do any additional setup after loading the view.
    }
    

    

}
