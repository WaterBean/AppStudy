//
//  MainViewController.swift
//  RecipeSearch
//
//  Created by 한수빈 on 5/28/24.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    
    
    
    let recipeManager = RecipeManager()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
        searchBar.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
         
         
     }
     
    
}


extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2 //recipeManager.root?.recipes.row.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if section == 0 {
            label.text = "My Picks"
        } else{
            label.text = "Recent Registered"
        }
        label.font = .boldSystemFont(ofSize: 17)
        
        return label
    }
    
}

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        recipeManager.search(query: searchText)
        searchCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        //print(recipeManager.root?.recipes.row[0]["ATT_FILE_NO_MAIN"])
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath.item)
        print(recipeManager.root?.recipes.row[indexPath.item])
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        guard let image = recipeManager.root?.recipes.row[indexPath.item]["ATT_FILE_NO_MAIN"] else { return cell }
        cell.imageView.kf.setImage(with: URL(string: image)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11//recipeManager.root?.recipes.row.count ?? 0
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3
        return CGSize(width: width, height: width)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}

// Custom UICollectionViewCell
class ImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
}
