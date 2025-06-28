//
//  TaskCalenderListViewCell.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI

struct TaskCalenderListViewCell: View {
    private let colorScheme: [Color] = [
        Color(hex: "dbd4fd")!,
        Color(hex: "defff9")!,
        Color(hex: "e6f19d")!,
        Color(hex: "fae8ef")!,
        Color(hex: "ffe3c3")!
    ]

    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 1)
                .foregroundColor(colorScheme[Int.random(in: 0..<colorScheme.count)])

            HStack {
                VStack(spacing: 8) {
                    Text("10.00 AM - 06:00 PM")
                        .typographyStyle(.Custom(size: 12, .regular))
                        .foregroundColor(.TextInverseSecondary)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Saloon App Wireframe")
                        .typographyStyle(.Custom(size: 14, .regular))
                        .foregroundColor(.TextInversePrimary)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    HStack(spacing: 4) {
                        Text("Due Date: ")
                            .typographyStyle(.Custom(size: 12, .regular))
                            .foregroundColor(.TextInverseSecondary)
                            .lineLimit(1)
                        Text("August 25")
                            .typographyStyle(.Custom(size: 12, .regular))
                            .foregroundColor(.TextInversePrimary)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Spacer()
                    }
                }
                .padding(.all, 16)
            }
            .background(Color.BackgroundSecondaryPrimary)
        }
    }
}

#Preview {
    TaskCalenderListViewCell()
}
