//
//  SecondaryPasswordViewController.swift
//  LoginProject
//
//  Created by 한수빈 on 4/30/24.
//

import UIKit

class SecondaryPasswordViewController: UIViewController {
    var isAuthenticationSuccessful: Bool = false
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 정상 인증 상태를 전달
        NotificationCenter.default.post(name: Notification.Name("AuthenticationSuccessful"), object: self, userInfo: ["isAuthenticationSuccessful": isAuthenticationSuccessful])
        
    }
    
    func keyWasTapped(character: String) {
        
    }
    var wrongCount = 0
    let passwordCircleSize = 20
    var inputPassword = "" {
        didSet {
            if inputPassword.count == 0 {
                firstWordView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                secondWordView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                thirdWordView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                fourthWordView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                
            }
            else if inputPassword.count == 1 {
                firstWordView.backgroundColor = .white
                secondWordView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            } else if inputPassword.count == 2 {
                secondWordView.backgroundColor = .white
                thirdWordView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            } else if inputPassword.count == 3 {
                thirdWordView.backgroundColor = .white
                fourthWordView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            } else if inputPassword.count == 4 {
                fourthWordView.backgroundColor = .white
                if inputPassword == userPassword {
                    isAuthenticationSuccessful = true
                    closeModal()
                } else {
                    instructionsLabel.text = "비밀번호가 맞지 않아요"
                    wrongCount += 1
                    inputPassword = ""
                    helpLabel.text = "다시 눌러주세요 (\(wrongCount)/5)"
                }
            }
        }
    }
    let userPassword = "1111"
    
    private lazy var firstWordView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: passwordCircleSize))
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.clipsToBounds = true
        view.layer.cornerRadius = view.frame.height / 2
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var secondWordView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: passwordCircleSize))
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = view.frame.height / 2
        view.clipsToBounds = true
        return view
    }()
    private lazy var thirdWordView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: passwordCircleSize))
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = view.frame.height / 2
        view.clipsToBounds = true
        return view
    }()
    private lazy var fourthWordView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: passwordCircleSize))
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = view.frame.height / 2
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var plusImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "plus"))
        imageView.tintColor = .white
        
        return imageView
    }()
    
    private lazy var fifthWordView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: passwordCircleSize))
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        view.layer.cornerRadius = view.frame.height / 2
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호를 눌러주세요"
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    private lazy var helpLabel: UILabel = {
        let label = UILabel()
        label.text = "숫자 4자리 + 영문자 1자리"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    
    // 모달 내리기
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [firstWordView,secondWordView, thirdWordView, fourthWordView,plusImageView,fifthWordView])
        stview.spacing = 18
        stview.axis = .horizontal
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    @objc func closeModal() {
        self.dismiss(animated: true)
    }
    
    
    // MARK: 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blur = UIBlurEffect(style: .dark)
        let vib = UIVibrancyEffect(blurEffect: blur, style: .secondaryFill)
        
        let vibView = UIVisualEffectView(effect: vib)
        
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        vibView.frame = blurView.bounds
        vibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // blurView를 먼저 추가하고, 그 위에 vibView를 추가합니다.
        view.addSubview(blurView)
        blurView.contentView.addSubview(vibView) // contentView에 vibrancy 효과를 추가합니다.
        
        // 여기에 다른 UI 구성 요소를 추가할 수 있습니다. 예를 들어, vibView에 라벨을 추가할 수 있습니다.
        // 이는 vibrancy 효과가 적용됩니다.
        view.addSubview(firstWordView)
        view.addSubview(closeButton)
        view.addSubview(instructionsLabel)
        view.addSubview(helpLabel)
        view.addSubview(stackView)
        
        configureKeypad()
        setupAutoLayout()
    }
    
    private func configureKeypad() {
        
        // 숫자 버튼 생성
        let button0 = UIButton()
        let button1 = UIButton()
        let button2 = UIButton()
        let button3 = UIButton()
        let button4 = UIButton()
        let button5 = UIButton()
        let button6 = UIButton()
        let button7 = UIButton()
        let button8 = UIButton()
        let button9 = UIButton()
        let cancelButton = UIButton()
        // 버튼에 숫자 할당
        button0.setTitle("0", for: .normal)
        button1.setTitle("1", for: .normal)
        button2.setTitle("2", for: .normal)
        button3.setTitle("3", for: .normal)
        button4.setTitle("4", for: .normal)
        button5.setTitle("5", for: .normal)
        button6.setTitle("6", for: .normal)
        button7.setTitle("7", for: .normal)
        button8.setTitle("8", for: .normal)
        button9.setTitle("9", for: .normal)
        cancelButton.setTitle("X", for: .normal)
        
        button0.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        button1.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        button4.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        button5.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        button6.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        button7.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        button8.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        button9.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped(_:)), for: .touchUpInside)
        
        let buttons = [button0,button1,button2,button3,button4,button5,button6,button7,button8,button9].shuffled()
        print(buttons[0].titleLabel?.text)
        // 숫자 버튼을 3x4 스택 뷰로 배치
        let numberButtonStackView1 = UIStackView(arrangedSubviews: [
            buttons[0],buttons[1],buttons[2]
        ])
        let numberButtonStackView2 = UIStackView(arrangedSubviews: [
            buttons[3],buttons[4],buttons[5]
        ])
        
        let numberButtonStackView3 = UIStackView(arrangedSubviews: [
            buttons[6],buttons[7],buttons[8]
        ])
        
        let numberButtonStackView4 = UIStackView(arrangedSubviews: [
            UIView(), buttons[9], cancelButton
        ])
        
        
        numberButtonStackView1.axis = .horizontal
        numberButtonStackView1.distribution = .fillEqually
        numberButtonStackView1.spacing = 10
        numberButtonStackView2.axis = .horizontal
        numberButtonStackView2.distribution = .fillEqually
        numberButtonStackView2.spacing = 10
        numberButtonStackView3.axis = .horizontal
        numberButtonStackView3.distribution = .fillEqually
        numberButtonStackView3.spacing = 10
        numberButtonStackView4.axis = .horizontal
        numberButtonStackView4.distribution = .fillEqually
        numberButtonStackView4.spacing = 10
        
        numberButtonStackView1.translatesAutoresizingMaskIntoConstraints = false
        numberButtonStackView1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        // 전체 스택 뷰 생성
        let mainStackView = UIStackView(arrangedSubviews: [numberButtonStackView1,numberButtonStackView2,numberButtonStackView3,numberButtonStackView4])
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.spacing = 20
        
        // 전체 스택 뷰를 뷰에 추가
        view.addSubview(mainStackView)
        
        // 제약조건 설정
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
        ])
    }
    @objc func numberButtonTapped(_ sender: UIButton) {
        if let number = sender.title(for: .normal) {
            inputPassword.append(number)
            print("Current Password: \(inputPassword)")
        }
    }
    
    @objc func cancelButtonTapped(_ sender: UIButton) {
        if let number = sender.title(for: .normal) {
            inputPassword.popLast()
        }
    }
    
    private func setupAutoLayout() {
        firstWordView.translatesAutoresizingMaskIntoConstraints = false
        
        firstWordView.widthAnchor.constraint(equalToConstant: CGFloat(passwordCircleSize)).isActive = true
        firstWordView.heightAnchor.constraint(equalToConstant: CGFloat(passwordCircleSize)).isActive = true
        
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        
        closeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        instructionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        instructionsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250).isActive = true
        
        helpLabel.translatesAutoresizingMaskIntoConstraints = false
        
        helpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        helpLabel.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: 10).isActive = true
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: helpLabel.bottomAnchor, constant: 30).isActive = true
        
    }
    
}



