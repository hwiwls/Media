//
//  TrendingModel.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import Foundation

import Foundation

// MARK: - Trend
struct TrendingModel: Codable {
    let page: Int
    let results: [Result]
    let total_pages, total_results: Int
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool
    let backdrop_path: String
    let id: Int
    let name: String
    let original_language: OriginalLanguage
    let original_name, overview, poster_path: String
    let media_type: MediaType
    let genre_ids: [Int]
    let popularity: Double
    let first_air_date: String
    let vote_average: Double
    let vote_count: Int
    let origin_country: [String]
}

enum MediaType: String, Codable {
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
    case zh = "zh"
}
