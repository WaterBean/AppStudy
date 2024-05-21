//
//  ViewController.swift
//  AnabadaBoard
//
//  Created by 한수빈 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    var goodsArr: [Goods] = []
    
    let goodsDataManager = DataManager()

    let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.tintColor = .white
        //
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNaviBar()
        setupTableView()
        setupDatas()
        setupTableViewConstraints()
        setupAddButton()
    }

    @objc func addButtonTapped() {
        
        
    }
    
    func setupNaviBar() {
        title = "아나바다 마켓"
        
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        
        let navfilterItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle"), style: .plain, target: self, action: nil)
        let navLikeItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = navfilterItem
        navigationItem.rightBarButtonItem = navLikeItem

    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
       
        tableView.rowHeight = 120
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupDatas() {
        goodsDataManager.makeGoodsData() // 일반적으로는 서버에 요청
        goodsArr = goodsDataManager.getGoodsData()  // 데이터 받아서 뷰컨의 배열에 저장
    }

    
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

    
    func setupAddButton(){
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50),

            addButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goodsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let goods = goodsArr[indexPath.row]
        
        cell.mainImageView.image = goods.images[0]
        cell.goodsNameLabel.text = goods.name
        cell.descriptionLabel.text = goods.desc
        
        
        return cell
    }
    
    
}



extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.goodsData = goodsArr[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
