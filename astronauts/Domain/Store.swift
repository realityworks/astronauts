//
//  Store.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

protocol StoreDelegate {
    func astronautListUpdated() -> AstronautList?
    func astronautDetailUpdated() -> AstronautDetail?
    func error() -> String?
}

/// Don't like this, but it's better than making all models a struct.
/// If we use KVO, our models need to be structs.
/// This is why it's better to use either RxSwift, Combine or promises for stream of value

extension StoreDelegate {
    func astronautListUpdated() -> AstronautList? { nil }
    func astronautDetailUpdated() -> AstronautDetail? { nil }
    func error() -> String? { nil }
}

/// Store for access to app state. Initailise with use cases.

class Store: NSObject {
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

    // MARK: State management
    /// In a scaled application we would use either KVO, delegate, Promises, RxSwift,  or Combine
    var astronautList: AstronautList? = nil
    var astronautDetail: AstronautDetail? = nil
    var error: String? = nil
}
