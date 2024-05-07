//
//  MemberDetailViewController.swift
//  StudyDiary
//
//  Created by 한수빈 on 5/7/24.
//

import UIKit

class MemberDetailViewController: UIViewController {
    var member: Member?
    
    @IBOutlet weak var lblNick: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAge: UILabel!
    
    
    @IBOutlet weak var lblDesc: UILabel!
    
    
    @IBOutlet weak var lblMBTI: UILabel!
    
    @IBOutlet weak var lblInterest: UILabel!
    
    @IBOutlet weak var lblHobby: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblNick.text = member?.nick
        lblName.text = member?.name
        lblAge.text = member?.age
        lblDesc.text = member?.desc
        lblMBTI.text = member?.mbti
        lblInterest.text = member?.interest
        lblHobby.text = member?.hobby
        
        
        // Do any additional setup after loading the view.
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
