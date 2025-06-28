//
//  PrimaryButton.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI

public struct PrimaryButton: View {
    public var onClick: (() -> Void)?

    public init(onClick: (() -> Void)? = nil) {
        self.onClick = onClick
    }

    public var body: some View {
        HStack {
            Text("Submit")
                .typographyStyle(.Custom(size: 24, .bold))
                .foregroundColor(.primaryTextLight)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.all, 16)
        }
        .background(Color(hex: "fee4c1"))
        .cornerRadius(12)
        .frame(height: 48)
        .onTapGesture {
            onClick?()
        }
    }
}

#Preview {
    PrimaryButton()
}
