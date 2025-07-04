//
//  AnyRoutable.swift
//  MileTask
//
//  Created by asani on 30/06/25.
//

import SwiftUI

// MARK: - A type-erased wrapper for Routable
struct AnyRoutable: Routable {
    private let base: any Routable
    private let equals: (any Routable) -> Bool

    init<T: Routable>(_ routable: T) {
        base = routable
        equals = { other in
            guard let otherBase = other as? T else { return false }
            return routable == otherBase
        }
    }

    func makeView() -> AnyView {
        self.base.makeView()
    }

    func hash(into hasher: inout Hasher) {
        self.base.hash(into: &hasher)
    }

    static func == (lhs: AnyRoutable, rhs: AnyRoutable) -> Bool {
        lhs.equals(rhs.base)
    }
}

typealias Routable = ViewFactory & Hashable

protocol ViewFactory {
    func makeView() -> AnyView
}

protocol NavigationCoordinator {
    func push(_ path: any Routable)
    func popLast()
    func popToRoot()
}
