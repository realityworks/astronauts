//
//  APIService.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

protocol APIService {
    func loadAstronoutsList(
        completionHandler: @escaping (AstronautList?, Error?) -> Void
    )

    func loadAstronautDetail(
        for astronautId: Astronaut.ID,
        completionHandler: @escaping (AstronautDetail?, Error?) -> Void
    )
}
