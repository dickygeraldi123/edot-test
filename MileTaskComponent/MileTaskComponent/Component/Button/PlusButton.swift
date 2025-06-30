//
//  PlusButton.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI

public struct PlusButton: View {
    public var onClick: (() -> Void)?

    public init(onClick: (() -> Void)? = nil) {
        self.onClick = onClick
    }

    public var body: some View {
        HStack {
            Image.ComponentImage(named: "ic_plus")?
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 24, height: 24)
                .padding(.all, 16)
        }
        .background(Color(hex: "fee4c1"))
        .cornerRadius(12)
        .onTapGesture {
            onClick?()
        }
    }
}

#Preview {
    PlusButton()
}
