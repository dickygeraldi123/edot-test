//
//  PriorityTaskEnum.swift
//  MileTaskDomain
//
//  Created by asani on 28/06/25.
//

public enum PriorityTaskEnum: String, CaseIterable {
    case High = "High"
    case Medium = "Medium"
    case Low = "Low"

    public var getColor: String {
        switch self {
        case .High:
            return "fe4141"
        case .Medium:
            return "bb8e11"
        case .Low:
            return "007c02"
        }
    }
}
