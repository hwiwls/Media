//
//  TopRatedModel.swift
//  Media
//
//  Created by hwijinjeong on 1/30/24.
//

import Foundation

// MARK: - TopRated
struct TopRatedModel: Decodable {
    let results: [TopRated]
}

// MARK: - Result
struct TopRated: Decodable {
    let poster_path: String
    let name: String
}
