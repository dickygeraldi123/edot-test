//
//  Locking.swift
//  RxFramework
//
//  Created by William Huang on 16/07/22.
//  Copyright © 2022 Ajaib Technologies. All rights reserved. All rights reserved.
//


import Foundation

extension UnsafeMutablePointer where Pointee == os_unfair_lock_s {
    @inlinable @discardableResult
    internal func sync<R>(_ work: () -> R) -> R {
        os_unfair_lock_lock(self)
        defer { os_unfair_lock_unlock(self) }
        return work()
    }
}

extension NSRecursiveLock {
    @inlinable @discardableResult
    @_spi(Internals) public func sync<R>(work: () -> R) -> R {
        lock()
        defer { self.unlock() }
        return work()
    }
}
