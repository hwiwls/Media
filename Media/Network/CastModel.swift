//
//  CastModel.swift
//  Media
//
//  Created by hwijinjeong on 1/31/24.
//

import Foundation

// MARK: - CastModel
struct CastModel: Codable {
    let cast, crew: [Cast]
    let id: Int
}

// MARK: - Cast
struct Cast: Codable {
    let name: String
    let department: Department?
}

enum Department: String, Codable {
    case acting = "Acting"
    case creator = "Creator"
    case directing = "Directing"
    case writing = "Writing"
}
