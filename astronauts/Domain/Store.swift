//
//  Store.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

/// Store for access to app state. Initailise with use cases.

@objc class Store: NSObject {
    static let shared: Store = Store()


    // MARK: UseCase Management

    private var useCaseFactory: UseCaseFactory? = nil
    static func initialise(useCases: UseCaseFactory) {
        shared.useCaseFactory = UseCaseFactory()
    }

    func build<T: UseCase>(_ type: T.Type) -> T? {
        guard let useCaseFactory = useCaseFactory else {
            return nil
        }

        return useCaseFactory.build(type)
    }

    func errorOccured(_ newError: Error) {
        // Handle error state management
        error = newError
    }

    // MARK: State management

    /// In a scaled application we would use either KVO, delegate, Promises, RxSwift,  or Combine
    var astronautList: AstronautList? = nil {
        didSet {
            astronautListUpdaters.forEach { $0.handler(astronautList) }
        }
    }
    var astronautListUpdaters: [AstronautListUpdater] = []

    var astronautDetail: AstronautDetail? = nil  {
        didSet {
            astronautDetailUpdaters.forEach { $0.handler(astronautDetail) }
        }
    }
    var astronautDetailUpdaters: [AstronautDetailUpdater] = []
    

    var error: Error? = nil {
        didSet {
            if let error = error {
                errorUpdaters.forEach { $0.handler(error) }
            }
        }
    }
    var errorUpdaters: [ErrorUpdater] = []
}
