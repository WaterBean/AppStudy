//
//  AddMemberViewController.swift
//  StudyDiary
//
//  Created by 한수빈 on 5/7/24.
//

import UIKit

class AddMemberViewController: UIViewController {
    
    @IBOutlet weak var tfNick: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfDesc: UITextField!
    @IBOutlet weak var tfMBTI: UITextField!
    @IBOutlet weak var tfInterest: UITextField!
    @IBOutlet weak var tfHobby: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addMemberAct(_ sender: Any) {
        guard let nick = tfNick.text,
              let name = tfName.text,
              let age = tfAge.text,
              let desc = tfDesc.text,
              let mbti = tfMBTI.text,
              let interest = tfInterest.text,
              let hobby = tfHobby.text
        else { 
            
            return }

        member.append(Member(name: name, nick: nick, desc: desc, age: age, mbti: mbti, interest: interest, hobby: hobby))
        
        //self.performSegue(withIdentifier: "addMember", sender: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
