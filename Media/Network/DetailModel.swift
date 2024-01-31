//
//  DetailModel.swift
//  Media
//
//  Created by hwijinjeong on 1/31/24.
//

import Foundation

// MARK: - DetailModel
struct DetailModel: Codable {
    let id: Int
    let seasons: [Season]
}

// MARK: - Season
struct Season: Codable {
    let air_date: String
    let episode_count, id: Int
    let name, overview, poster_path: String
    let season_number, vote_average: Int
}
