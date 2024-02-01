//
//  CastModel.swift
//  Media
//
//  Created by hwijinjeong on 1/31/24.
//

import Foundation

// MARK: - CastModel
struct CastModel: Decodable {
    let cast, crew: [Cast]
    let id: Int
}

// MARK: - Cast
struct Cast: Decodable {
    let name: String
    let department: Department?
}

enum Department: String, Codable {
    case acting = "Acting"
    case creator = "Creator"
    case directing = "Directing"
    case writing = "Writing"
    case art = "Art"
    case camera = "Camera"
    case costume = "Costume & Make-Up"
    case crew = "Crew"
    case editing = "Editing"
    case production = "Production"
    case sound = "Sound"
    case effects = "Effects"
    case visulaEffects = "Visual Effects"
}
