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
    
    enum CodingKeys: CodingKey {
        case backdrop_path
        case id
        case name
        case overview
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.backdrop_path = try container.decodeIfPresent(String.self, forKey: .backdrop_path) ?? ""
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.overview = try container.decode(String.self, forKey: .overview)
    }
}
