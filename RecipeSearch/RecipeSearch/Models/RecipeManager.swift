//
//  RecipeManager.swift
//  RecipeSearch
//
//  Created by 한수빈 on 5/28/24.
//

import Foundation
import Alamofire

final class RecipeManager {
    var root: Root?
    func search(query: String = "") {
        let endPoint = "https://openapi.foodsafetykorea.go.kr/api/79e10d6fdd9b4745bdb7/COOKRCP01/json/1/10"
        AF.request(endPoint,method: .get).responseDecodable(of: Root.self) { response in
            switch response.result {
            case .success(let root):
                self.root = root
                print(self.root?.recipes.row)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
