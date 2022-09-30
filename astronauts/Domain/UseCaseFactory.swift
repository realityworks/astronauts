//
//  UseCaseFactory.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

/// Need a way to manage usecases and dependencies at runtime.
/// Lets make it generic.
/// Just an example to show how we can manage dependencies. Probably overkill for a small project, but it shows the idea.

class UseCaseFactory {
    private var useCaseRegister: [String: any UseCase] = [:]

    func register<T: UseCase>(useCase: T.Type, instance: T) {
        useCaseRegister[String(describing: useCase)] = instance
    }

    func build<T: UseCase>(_ type: T.Type) -> T? {
        return useCaseRegister[String(describing: type)] as? T
    }
}
