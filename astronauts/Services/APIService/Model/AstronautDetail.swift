//
//  AstronautDetail.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

struct AstronautDetail: Codable {
    let id: Int
    let bio: String?
    let date_of_birth: String?
    //let flights: [Flight]
}
