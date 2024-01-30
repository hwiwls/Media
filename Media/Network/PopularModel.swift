//
//  PopularModel.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import Foundation

// MARK: - PopularModel
struct PopularModel: Decodable {
    let results: [Popular]
}

// MARK: - Result
struct Popular: Decodable {
    let poster_path: String?
    let name: String
}
