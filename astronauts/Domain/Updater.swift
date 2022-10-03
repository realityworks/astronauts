//
//  Updater.swift
//  astronauts
//
//  Created by Piotr Suwara on 3/10/2022.
//

import Foundation

// Boiler plate for updaters, generally use something like Combine/RXSwift instead.
protocol EquatableUpdater: Equatable {
    var id: UUID { get }
}

extension EquatableUpdater where Self: EquatableUpdater {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

struct AstronautListUpdater: EquatableUpdater {
    let id: UUID = .init()
    let handler: (AstronautList?)->()
}

struct AstronautDetailUpdater: EquatableUpdater {
    let id: UUID = .init()
    let handler: (AstronautDetail?)->()
}

struct ErrorUpdater: EquatableUpdater {
    let id: UUID = .init()
    let handler: (Error)->()
}
