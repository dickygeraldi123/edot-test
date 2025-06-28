//
//  PriorityCircleCell.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI
import MileTaskDomain

public struct PriorityCircleCell: View {
    public var priority: PriorityTaskEnum?

    public init(priority: PriorityTaskEnum? = nil) {
        self.priority = priority
    }

    public var body: some View {
        HStack {
            Text(priority?.rawValue ?? "")
                .typographyStyle(.Custom(size: 11, .bold))
                .foregroundColor(.whiteColor)
                .padding(.all, 8)
        }
        .background(Color(hex: priority?.getColor ?? ""))
        .cornerRadius(12)
    }
}
