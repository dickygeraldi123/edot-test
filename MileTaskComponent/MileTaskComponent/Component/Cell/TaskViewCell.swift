//
//  TaskViewCell.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI

struct TaskViewCell: View {
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                HStack {
                    PriorityCircleCell(priority: .High)
                    Spacer()
                    Text("90%")
                        .typographyStyle(.Custom(size: 12, .medium))
                        .foregroundColor(.TextInverseSecondary)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                Text("Salon App Wireframe")
                    .typographyStyle(.Custom(size: 14, .bold))
                    .foregroundColor(.TextInverseSecondary)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    Image.ComponentImage(named: Image.getImageByMode(named: "ic_time"))?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 12, height: 12)

                    Text("10.00 AM - 06:00 PM")
                        .typographyStyle(.Custom(size: 14, .regular))
                        .foregroundColor(.TextInversePrimary)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                HStack(spacing: 4) {
                    Text("Due Date : ")
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
            .background(Color.BackgroundSecondaryPrimary)
        }
        .cornerRadius(12)
    }
}

#Preview {
    TaskViewCell()
}
