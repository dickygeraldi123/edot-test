//
//  DataViewState.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import Foundation

public enum ErrorStateToast: Equatable {
    case success(message: String)
    case warning(message: String)
    case failure(message: String)

    public var message: String {
        switch self {
        case .success(let message), .warning(let message), .failure(let message):
            return message
        }
    }
}

public enum DataViewState<T: Equatable>: Equatable {
    case loading
    case empty
    case error(error: String)
    case toast(ErrorStateToast)
    case data(T)
    case complete

    public var value: T? {
        if case let .data(t) = self {
            return t
        }
        return nil
    }

    public var errData: String? {
        if case let .error(e) = self {
            return e
        }
        return nil
    }

    public var isError: Bool {
        if case .error = self {
            return true
        }
        return false
    }
}
