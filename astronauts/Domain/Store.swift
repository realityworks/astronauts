//
//  Store.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

/// Store for access to app state. Initailise with use cases.

class Store {
    static let shared: Store = Store()

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
}
