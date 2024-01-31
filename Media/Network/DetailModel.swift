//
//  DetailModel.swift
//  Media
//
//  Created by hwijinjeong on 1/31/24.
//

import Foundation

// MARK: - DetailModel
struct DetailModel: Decodable {
    let id: Int
    let seasons: [Season]
    let last_episode_to_air: Episode?
    let next_episode_to_air: Episode?
}

// MARK: - Season
struct Season: Decodable {
    let name: String
    let overview: String?
    let still_path: String?
}

struct Episode: Decodable {
    let still_path: String?
}
