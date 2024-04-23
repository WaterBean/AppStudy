//
//  ViewController.swift
//  ScaleMaker
//
//  Created by 한수빈 on 4/18/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var lblWarnigText: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var doView: UIView!
    @IBOutlet weak var reView: UIView!
    @IBOutlet weak var miView: UIView!
    @IBOutlet weak var faView: UIView!
    @IBOutlet weak var solView: UIView!
    @IBOutlet weak var laView: UIView!
    @IBOutlet weak var siView: UIView!
    
    let scale = ["FX_piano_0","FX_piano_1","FX_piano_2","FX_piano_3","FX_piano_4","FX_piano_5","FX_piano_6"]
    var views: [UIView] = []
    var scaleURL: [URL] = []
    var player: AVAudioPlayer?
    var timer: Timer?
    var isPlay = false
    
    var number = 0
    var index = 0 {
        didSet {
            if index >= scale.count {
                index = 0
            }
            views[index].backgroundColor = .magenta
            if !isPlay {
                views[index].backgroundColor = .lightGray
            }
        }
        willSet {
            views[index].backgroundColor = .lightGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWarnigText.isHidden = true
        // Do any additional setup after loading the view.
        textField.delegate = self
        print(scale)
        for s in scale {
            guard let path = Bundle.main.path(forResource: s, ofType: "mp3") else { return }
            let url = URL(fileURLWithPath: path)
            
            print(url)
            scaleURL.append(url)
        }

        
        
        views = [siView,doView,reView,miView,faView,solView,laView]
        
        for view in views {
            view.layer.cornerRadius = 20
            view.clipsToBounds = true
            view.backgroundColor = .lightGray
        }
    }

    @IBAction func setLabelText(_ sender: Any) {
        if textField.text == "" {
            lblWarnigText.isHidden = false
        } else {
            lblTitle.text = textField.text
            lblWarnigText.isHidden = true
        }
    }
    
    @IBAction func playCScale(_ sender: Any) {
        let btn = sender as! UIButton
        if !isPlay {
            isPlay = true
            btn.setTitle("Stop", for: .normal)
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(number), target: self, selector: #selector(playScale), userInfo: nil, repeats: true)
        } else {
            isPlay = false
            timer?.invalidate()
            btn.setTitle("Play", for: .normal)
            index = 0
        }
        
    }
    
    @objc func playScale(){
        player = try? AVAudioPlayer(contentsOf: scaleURL[index])
        player?.play()
        index += 1
        
    }
    
    
    
    @IBAction func changeSlider(_ sender: Any) {
        let sender = sender as! UISlider
        let seconds = Int(sender.value * 5)
        //mainLabel.text = "\(seconds) 초"
        print(seconds)
        number = seconds
        
    }
    
}


// MARK: TextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        lblWarnigText.isHidden = true

    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        lblWarnigText.isHidden = true

    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        lblWarnigText.isHidden = true
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        lblWarnigText.isHidden = true
        return true
    }
    
}
