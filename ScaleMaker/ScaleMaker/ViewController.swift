//
//  ViewController.swift
//  ScaleMaker
//
//  Created by 한수빈 on 4/18/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblWarnigText: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
    }

    @IBAction func setLabelText(_ sender: Any) {
        if textField.text == "" {
            
        }
        lblTitle.text = textField.text
    }
    
    @IBAction func playCScale(_ sender: Any) {
    }
    
    
}
// MARK: TextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
        
    
}
