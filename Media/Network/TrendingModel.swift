//
//  TrendingModel.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import Foundation

// MARK: - Trending
struct TrendingModel: Decodable {
    let results: [Result]
}

// MARK: - Result
struct Result: Decodable {
    let poster_path: String
    let name: String
}
