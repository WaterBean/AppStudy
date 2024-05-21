//
//  DetailViewController.swift
//  AnabadaBoard
//
//  Created by 한수빈 on 5/20/24.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    var goodsData: Goods?
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI() 
    }
    
    private func setupUI() {
        detailView.mainImageView.image = goodsData?.images[0]
        detailView.goodsNameLabel.text = goodsData?.name
        detailView.descriptionLabel.text = goodsData?.desc
        //detailView.priceLabel = goodsData?.price
        
    }
    
    
}

