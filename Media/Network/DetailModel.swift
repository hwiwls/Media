//
//  DetailModel.swift
//  Media
//
//  Created by hwijinjeong on 1/31/24.
//

import Foundation

// MARK: - DetailModel
struct DetailModel: Decodable {
    let backdropPath: String
    let id: Int
    let name: String
    let numberOfEpisodes, numberOfSeasons: Int
    let overview: String

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case name
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case overview
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backdropPath = try container.decode(String.self, forKey: .backdropPath) ?? ""
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.numberOfEpisodes = try container.decode(Int.self, forKey: .numberOfEpisodes)
        self.numberOfSeasons = try container.decode(Int.self, forKey: .numberOfSeasons)
        self.overview = try container.decode(String.self, forKey: .overview)
    }
}


