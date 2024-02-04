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
        do {
            self.id = try container.decode(Int.self, forKey: .id)
            self.poster_path = try container.decode(String?.self, forKey: .poster_path) ?? "TempImg"
            self.name = try container.decode(String.self, forKey: .name)
        } catch {
            // 예외 처리 추가
            print("Decoding error:", error)
            self.id = 0
            self.poster_path = "TempImg"
            self.name = ""
        }
    }
}
