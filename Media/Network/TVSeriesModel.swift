//
//  TrendingModel.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import Foundation

// MARK: - Trending
struct TVSeriesModel: Decodable {
    let results: [Movie]
}

// MARK: - Result
struct Movie: Decodable {
    var id: Int
    var poster_path: String
    let name: String
    
    enum CodingKeys: CodingKey {
        case id
        case poster_path
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.poster_path = try container.decode(String.self, forKey: .poster_path) ?? ""
        self.name = try container.decode(String.self, forKey: .name)
    }
}
