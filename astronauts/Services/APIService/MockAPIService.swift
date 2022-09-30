//
//  MockAPIService.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

class MockAPIService {
    func loadAstronoutsList(
        completionHandler: @escaping (AstronautList) -> Void
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let astronauts: [Astronaut] = [
                .init(
                    name: "Peter",
                    nationality: "Australian",
                    profile_image_thumbnail: "https://img.icons8.com/ios/500/swift--v1.png"
                )
            ]
            let astronautList: AstronautList = .init(
                count: 1,
                next: nil,
                previous: nil,
                results: astronauts
            )

            completionHandler(astronautList)
        }
    }

    func loadAstronautDetail(
        for astronaut: Astronaut,
        completionHandler: @escaping (AstronautDetail) -> ()
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let astronautDetail: AstronautDetail = .init(
                bio: "This is some text, really nice stuff",
                date_of_birth: "25 Jan 2021"
            )

            completionHandler(astronautDetail)
        }
    }
}
