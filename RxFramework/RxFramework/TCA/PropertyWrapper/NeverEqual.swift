//
//  NeverEqual.swift
//  RxFramework
//
//  Created by William Huang on 16/07/22.
//  Copyright © 2022 Ajaib Technologies. All rights reserved. All rights reserved.
//


@propertyWrapper
 public struct NeverEqual<Value> {
     private var value: Value
     private var numberOfIncrement: UInt8 = 0

     public var wrappedValue: Value {
         get { value }
         set {
             value = newValue
             if numberOfIncrement == .max {
                 numberOfIncrement = 0
             } else {
                 numberOfIncrement += 1
             }
         }
     }

     public var projectedValue: NeverEqual<Value> { self }

     public init(wrappedValue: Value) {
         self.value = wrappedValue
     }
 }

 extension NeverEqual: Equatable where Value: Equatable {}
