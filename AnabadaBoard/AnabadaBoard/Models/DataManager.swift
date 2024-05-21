//
//  DataManager.swift
//  AnabadaBoard
//
//  Created by 한수빈 on 5/21/24.
//

import UIKit

class DataManager {
    private var goodsDataArray: [Goods] = []
    
    func makeGoodsData() {
        goodsDataArray = [
            Goods(images: [UIImage()], name: "몰라", desc: "글쎄", price: 10000,like: false),
            Goods(images: [UIImage()], name: "몰라", desc: "글쎄", price: 10000,like: false),
            Goods(images: [UIImage()], name: "몰라", desc: "글쎄", price: 10000,like: false),
            Goods(images: [UIImage()], name: "몰라", desc: "글쎄", price: 10000,like: true),
            Goods(images: [UIImage()], name: "몰라", desc: "글쎄", price: 10000,like: false),
            Goods(images: [UIImage()], name: "몰라", desc: "글쎄", price: 10000,like: false),
            Goods(images: [UIImage()], name: "몰라", desc: "글쎄", price: 10000,like: false),
            Goods(images: [UIImage()], name: "몰라", desc: "글쎄", price: 10000,like: false),
        ]
    }
    
    func getGoodsData() -> [Goods] {
        return goodsDataArray
    }
}
