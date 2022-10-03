//
//  Astronaut.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

struct Astronaut: Identifiable, Codable {
    let id: Int
    let name: String
    let nationality: String
    let profile_image_thumbnail: String
}
