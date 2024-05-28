//
//  RecipeModel.swift
//  RecipeSearch
//
//  Created by 한수빈 on 5/27/24.
//

import Foundation

// MARK: - Root
struct Root: Codable {
    let recipes: Recipes

    enum CodingKeys: String, CodingKey {
        case recipes = "COOKRCP01"
    }
}

// MARK: - Recipes
struct Recipes: Codable {
    let totalCount: String
    let row: [[String: String]]
    let result: Result

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case row
        case result = "RESULT"
    }
}

// MARK: - Result
struct Result: Codable {
    let msg, code: String

    enum CodingKeys: String, CodingKey {
        case msg = "MSG"
        case code = "CODE"
    }
}

