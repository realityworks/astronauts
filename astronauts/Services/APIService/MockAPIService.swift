//
//  MockAPIService.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

class MockAPIService: APIService {
    static var instance: MockAPIService = .init()

    private init() {}

    func loadAstronoutsList(
        completionHandler: @escaping (AstronautList?, Error?) -> Void
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let astronauts: [Astronaut] = [
                .init(
                    id: 12,
                    name: "Peter",
                    nationality: "Australian",
                    profile_image_thumbnail: "https://img.icons8.com/ios/500/swift--v1.png"
                ),
                .init(
                    id: 3,
                    name: "George",
                    nationality: "American",
                    profile_image_thumbnail: "https://img.icons8.com/ios/500/swift--v1.png"
                )
            ]

            let astronautList: AstronautList = .init(
                count: 2,
                next: nil,
                previous: nil,
                results: astronauts
            )

            completionHandler(astronautList, nil)
        }
    }

    func loadAstronautDetail(
        for astronautId: Astronaut.ID,
        completionHandler: @escaping (AstronautDetail?, Error?) -> ()
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let astronautDetail: AstronautDetail = .init(
                id: 10,
                bio: "This is some text, really nice stuff. With some additoinal text to make this long enough so that we have a large bio",
                date_of_birth: "25 Jan 2021"
            )

            completionHandler(astronautDetail, nil)
        }
    }
}
