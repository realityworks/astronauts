//
//  UseCase.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import Foundation

protocol UseCase: AnyObject {
    var store: Store { get }
}
