//
//  EpicViewCell.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI

public struct EpicViewCell: View {
    public var body: some View {
        VStack {
            HStack {
                Image.ComponentImage(named: "")?
                    .resizable()
                    .frame(width: 48, height: 48)
                VStack(spacing: 8) {
                    Text("Wireframe")
                        .typographyStyle(.Custom(size: 16, .bold))
                        .foregroundColor(.TextInversePrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("10 Tasks")
                        .typographyStyle(.Custom(size: 12, .medium))
                        .foregroundColor(.TextInversePrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.all, 16)
        }
        .cornerRadius(12)
        .background(Color.blue)
    }
}

#Preview {
    EpicViewCell()
}
