//
//  AstronautDetailViewModel.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

protocol AstronautDetailViewModelDelegate {
    func startLoading()
    func didLoadData()
    func failedLoading()
}

class AstronautDetailViewModel {
    private let store: Store
    private let astronautDataUseCase: AstronautsDataUseCase?
    private var astronautDetailUpdater: AstronautDetailUpdater? = nil

    var delegate: AstronautDetailViewModelDelegate? = nil

    init(dependencies: Dependencies = AstronautDetailViewModel.real) {
        self.store = dependencies.store
        self.astronautDataUseCase = dependencies.astronautDataUseCase

        astronautDetailUpdater = .init(handler: { [weak self] list in
            DispatchQueue.main.async {
                self?.delegate?.didLoadData()
            }
        })

        if let astronautDetailUpdater = astronautDetailUpdater {
            store.astronautDetailUpdaters.append(astronautDetailUpdater)
        }
    }

    deinit {
        guard let index = store.astronautDetailUpdaters.firstIndex(where: { $0 == astronautDetailUpdater }) else {
            return
        }

        store.astronautDetailUpdaters.remove(at: index)
    }

    func loadSelectedAstronaut() {
        guard let selectedAstronautId = store.selectedAstronautId else {
            store.errorOccured("No selected astronaut")
            delegate?.failedLoading()
            return
        }

        delegate?.startLoading()
        astronautDataUseCase?.loadAstronautDetails(for: selectedAstronautId)
    }
}

// MARK: Computed Properties

extension AstronautDetailViewModel {
    private var selectedAstronaut: Astronaut? {
        store.astronautList?.results.first(where: { $0.id == store.selectedAstronautId })
    }

    var name: String {
        guard let astronaut = selectedAstronaut else {
            return "N/A"
        }

        return astronaut.name
    }

    var bio: String {
        guard let bio = store.astronautDetail?.bio else {
            return "N/A"
        }

        return bio
    }

    var numFlights: String {
        guard let numFlights = store.astronautDetail?.flights.count else {
            return "N/A"
        }

        return "Has flown \(numFlights) flight\(numFlights == 1 ? "" : "s")"
    }

    var dateOfBirth: String {
        guard let dob = store.astronautDetail?.date_of_birth else {
            return "N/A"
        }

        return "Born \(dob)"
    }
}

// MARK: Dependencies

extension AstronautDetailViewModel {
    struct Dependencies {
        let store: Store
        let astronautDataUseCase: AstronautsDataUseCase?
    }

    static var real = {
        Dependencies(
            store: Store.shared,
            astronautDataUseCase: Store.shared.build(AstronautsDataUseCase.self)
        )
    }()
}
