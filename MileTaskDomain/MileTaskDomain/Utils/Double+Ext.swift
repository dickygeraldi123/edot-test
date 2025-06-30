//
//  Double+Ext.swift
//  MileTaskDomain
//
//  Created by asani on 28/06/25.
//

import Foundation

public extension Double {
    func formatDate() -> String {
        let date = Date(timeIntervalSince1970: self)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy HH:mm"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: date)
    }
}
