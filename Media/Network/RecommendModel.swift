//
//  RecommendModel.swift
//  Media
//
//  Created by hwijinjeong on 2/2/24.
//

import Foundation

struct RecommendModel: Decodable {
    let results: [TVSeries]
}

// MARK: - Result
struct TVSeries: Decodable {
    let backdrop_path: String?
    let id: Int
    let name: String
    let overview: String
    let poster_path: String
}
