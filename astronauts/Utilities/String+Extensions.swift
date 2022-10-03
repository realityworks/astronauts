//
//  String+Extensions.swift
//  astronauts
//
//  Created by Piotr Suwara on 3/10/2022.
//

import Foundation

// Easily convert strings into errors

extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}
