//
//  APIService.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

protocol APIService {
    func loadAstronoutsList(
        completionHandler: @escaping () -> AstronautList
    )

    func loadAstronautDetail(
        for astronaut: Astronaut,
        completionHandler: @escaping () -> AstronautDetail
    )
}
