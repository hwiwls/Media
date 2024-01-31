//
//  TrendingModel.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import Foundation

// MARK: - Trending
struct TrendingModel: Decodable {
    let results: [Movie]
}

// MARK: - Result
struct Movie: Decodable {
    let id: Int
    let poster_path: String
    let name: String
}
