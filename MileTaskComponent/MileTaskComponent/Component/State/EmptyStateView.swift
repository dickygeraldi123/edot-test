//
//  EmptyStateView.swift
//  MileTaskComponent
//
//  Created by asani on 28/06/25.
//

import SwiftUI

public struct EmptyStateConfig {
    var title: String
    var desc: String
    var imageName: String

    public init(title: String, desc: String, imageName: String) {
        self.title = title
        self.desc = desc
        self.imageName = imageName
    }
}

public struct EmptyStateView: View {
    public var config: EmptyStateConfig
    
    public init(config: EmptyStateConfig) {
        self.config = config
    }

    public var body: some View {
        VStack(spacing: 8) {
            Image.ComponentImage(named: config.imageName)!
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)

            Text(config.title)
                .typographyStyle(.Custom(size: 16, .bold))
                .foregroundColor(.TextPrimary)
                .lineLimit(nil)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(config.desc)
                .typographyStyle(.Custom(size: 12, .medium))
                .foregroundColor(.TextPrimary)
                .lineLimit(nil)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
