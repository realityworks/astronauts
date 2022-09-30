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

    // MARK: State management

    /// In a scaled application we would use either KVO, delegate, Promises, RxSwift,  or Combine
    var astronautList: AstronautList? = nil {
        didSet {
            astronautListListener.forEach { $0(astronautList) }
        }
    }
    var astronautListListener: [(AstronautList?)->()] = []

    var astronautDetail: AstronautDetail? = nil  {
        didSet {
            astronautDetailListener.forEach { $0(astronautDetail) }
        }
    }

    var astronautDetailListener: [(AstronautDetail?)->()] = []
    

    var error: String? = nil {
        didSet {
            astronautDetailListener.forEach { $0(astronautDetail) }
        }
    }

    var errorListener: [(String?)->()] = []
}
