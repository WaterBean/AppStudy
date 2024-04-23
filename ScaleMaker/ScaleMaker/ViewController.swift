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

    
    let scale = ["FX_piano_0","FX_piano_1","FX_piano_2","FX_piano_3","FX_piano_4","FX_piano_5","FX_piano_6"]
    var scaleURL: [URL]?
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWarnigText.isHidden = true
        // Do any additional setup after loading the view.
        textField.delegate = self
        
        for s in scale {
            guard let path = Bundle.main.path(forResource: s, ofType: "mp3") else { return }
            let url = URL(fileURLWithPath: path)
            scaleURL?.append(url)
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
        
        guard let scaleURL else { return }
        for scale in scaleURL {
            do {
                player = try AVAudioPlayer(contentsOf: scale)
                player?.play()
            } catch {
                print("출력안됨")
            }
        }
    }
    
    @IBAction func changeSlider(_ sender: Any) {
        let a = sender as! UISlider
        a.value
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
    
}
