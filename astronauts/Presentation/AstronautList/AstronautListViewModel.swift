//
//  AstronautListViewModel.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

protocol AstronautListViewModelDelegate {
    func startLoading()
    func didLoadData()
    func failedLoading()
}

class AstronautListViewModel {
    private let store: Store
    private let astronautListUseCase: AstronautsListUseCase?
    private var astronautListUpdater: AstronautListUpdater? = nil

    var delegate: AstronautListViewModelDelegate? =  nil

    init(dependencies: Dependencies = .real) {
        self.store = dependencies.store
        self.astronautListUseCase = dependencies.astronautListUseCase


        astronautListUpdater = .init(handler: { [weak self] list in
            DispatchQueue.main.async {
                self?.delegate?.didLoadData()
            }
        })

        if let astronautListUpdater = astronautListUpdater {
            store.astronautListUpdaters.append(astronautListUpdater)
        }
    }

    deinit {
        guard let index = store.astronautListUpdaters.firstIndex(where: { $0 == astronautListUpdater }) else {
            return
        }

        store.astronautListUpdaters.remove(at: index)
    }

    func load() {
        guard let useCase = astronautListUseCase else {
            store.errorOccured("No use case available to work with")
            delegate?.failedLoading()
            return
        }

        useCase.loadAstronauts()
        delegate?.startLoading()
    }
}

// MARK: Computed properties

extension AstronautListViewModel {
    var numberOfAstronaughts: Int {
        store.astronautList?.count ?? 0
    }

    func astronautAt(index: Int) -> Astronaut? {
        guard let list = store.astronautList else {
            store.errorOccured("No astronaut list")
            return nil
        }

        guard index < list.count else {
            store.errorOccured("This is beyond the end of the astronaut list")
            return nil
        }

        return list.results[index]
    }
}

// MARK: Dependencies

// Let's use a nice clean dependencies structure that wraps all of our needs into one argument. Instead of passing a collection of arguments to the view model.
// In a larger project, you would have more transports and use cases. Each one with a single responsibility.

extension AstronautListViewModel {
    struct Dependencies {
        let store: Store
        let astronautListUseCase: AstronautsListUseCase?

        static var real = {
            Dependencies(
                store: Store.shared,
                astronautListUseCase: Store.shared.build(AstronautsListUseCase.self)
            )
        }()
    }
}
