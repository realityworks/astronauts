//
//  AstronautsListUseCase.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

/// UseCases in the domain layer handle the business logic.
/// It shows how good design works in apps.

class AstronautsDataUseCase: UseCase {

    let store: Store
    private let apiService: APIService

    init(dependencies: Dependencies = AstronautsDataUseCase.real) {
        self.store = dependencies.store
        self.apiService = dependencies.apiService
    }

    // Load astronauts
    func loadAstronauts() {
        apiService.loadAstronoutsList { [weak self] list, error in
            guard let self = self else {
                return
            }

            if let error = error {
                self.store.errorOccured(error)
                self.store.astronautList = nil

                return
            }

            self.store.astronautList = list
        }
    }

    // Load astronaut detail
    func loadAstronautDetails(for astronautId: Astronaut.ID) {
        apiService.loadAstronautDetail(for: astronautId) { [weak self] detail, error in
            guard let self = self else {
                return
            }

            if let error = error {
                self.store.errorOccured(error)
                return
            }

            self.store.astronautDetail = detail
        }
    }

    // Set the selected astronaut
    func selectAstronaut(withId id: Astronaut.ID) {
        store.selectedAstronautId = id
    }
}

// MARK: Dependencies

/// Use case dependencies consiste of the store and the API Services. Generally the store here is for writing

extension AstronautsDataUseCase {
    struct Dependencies {
        let store: Store
        let apiService: APIService
    }

    static var real: Dependencies = {
        Dependencies(
            store: Store.shared,
            apiService: RealAPIService.instance
        )
    }()

    static var mock: Dependencies = {
        Dependencies(
            store: Store.shared,
            apiService: MockAPIService.instance
        )
    }()
}


