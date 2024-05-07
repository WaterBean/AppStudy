//
//  MemberTableViewController.swift
//  StudyDiary
//
//  Created by 한수빈 on 5/7/24.
//

import UIKit

var member: [Member] = [
    Member(name: "한수빈", nick: "Taylor", desc: "안녕하세요 스위프트하는 테일러입니다.", age: "26", mbti: "ENTP", interest: "iOS, UI/UX", hobby: "애플 뮤직 켜놓고 멍때리기, 얼죽아"),
    Member(name: "임동현", nick: "Eren", desc: "자유를 추구하는 에렌입니다.", age: "26", mbti: "ENTP", interest: "iOS, 게임", hobby: "멍때리기, 게임"),
    Member(name: "박다현", nick: "Diane", desc: "이번엔 꼭 스위프트로 뭔가 만들어 내고 싶은 다이앤입니다 😊", age: "26", mbti: "ISFP", interest: "iOS", hobby: "클라이밍, 산, 수영"),
    Member(name: "박윤선", nick: "Avery", desc: "인천에 살고 애플기기 좋아합니다. 비전프로 체험하고 싶어요.", age: "26", mbti: "INFJ", interest: "iOS", hobby: "유튜브 보기, 맛집 검색하기"),
    Member(name: "이한슬", nick: "Christy", desc: "모두가 장벽없이 사용할 수 있는 어플을 개발하고 싶은 예비 개발자 Christy입니다!", age: "26", mbti: "INFP", interest: "iOS" , hobby: "얼죽아, 유튜브 보기, 수영, 여행, 맛집 검색하기, 디즈니, 술"),
    Member(name: "이혜인", nick: "Chris", desc: "스위프트 열공중인 크리스입니다! 피아노가 취미이고, 요리하는 것도 좋아합니다. 새로 생긴 취미는 요가예요 🧘‍♀️", age: "26", mbti: "ENTP", interest: "iOS", hobby: "피아노, 맛집탐방, 술, 요가")
]

class MemberTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return member.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "member", for: indexPath)

        let member = member[indexPath.row]
        
        let profile = cell.viewWithTag(3) as? UIImageView
        let nick = cell.viewWithTag(1) as? UILabel
        let desc = cell.viewWithTag(2) as? UILabel
        
        profile?.image = UIImage(named: "몰라")
        nick?.text = member.nick
        desc?.text =  member.desc
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    @IBAction func addMember(segue: UIStoryboardSegue) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let member = member[indexPath.row]
            if let targetVC = segue.destination as? MemberDetailViewController {
                targetVC.member = member
            }
        } else if segue.identifier == "detailMyProfile" {
            let member = member[0]
            if let targetVC = segue.destination as? MemberDetailViewController {
                targetVC.member = member
            }
        }
    }
    

}
